FactoryGirl.define do
  data =
    [
      "janina.h20@o2.pl",
      "karol.krawczyk@gmail.com",
      "ela123@yahoo.com",
      "sebamati@onet.com",
      "janusz.tracz@onet.pl",
      "paweltomasz.nowak@gmail.com",
      "dawid.klos@gmail.com",
      "pope.francis@gmail.com",
      "jerzystraszny@onet.pl",
      "richie.stallman@gnu.com",
      "beatagks@gmail.com",
      "janusz.laskowski@yahoo.com",
      "mrrobot@protonmail.com",
      "zbigniew.stonoga@kukle.org",
      "hermann.brunner@schweiz.ch",
      "steven.seagal@yahoo.com",
      "kotwbutach11@gmail.com",
      "abigguy@batman.com",
      "no1domains2left3forme4@gmail.com",
      "michal.bialek@wykop.pl"
    ]
  factory :user do
    email
    password '12345678'
  end

  sequence(:email) do |n|
    if data[n].nil?
      "example#{n}@gmail.com"
    else
      data[n]
    end
  end
end
