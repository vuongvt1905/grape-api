module API
  module V1
    class Persons < Grape::API

      resource :persons do
        desc "Return all persons"
        get do
          Person.all
        end

        params do
          requires :id, type: Integer, desc: "Id of person"
        end
        get ':id' do
          Person.find(params[:id])
        end

        params do
          requires :firstname, type: String, desc: "firstname of person"
          requires :lastname, type: String, desc: "lastname of person"
        end
        post do
          Person.create(declared(params))
        end

        params do
          requires :id, type: Integer, desc: "Id of person"
        end
        delete ':id' do
          Person.find(params[:id]).destroy
        end
      end
    end
  end
end
