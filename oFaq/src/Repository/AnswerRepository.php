<?php

namespace App\Repository;

use App\Entity\Answer;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method Response|null find($id, $lockMode = null, $lockVersion = null)
 * @method Response|null findOneBy(array $criteria, array $orderBy = null)
 * @method Response[]    findAll()
 * @method Response[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AnswerRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Answer::class);
    }

     /**
     * 
     * @return Answer[] 
     */
    public function findAnswerIfVisible()
    {
        $query = $this->createQueryBuilder('r')
                      ->orderBy('r.createdAt', 'DESC')
                      ->where('r.visible = 1');
        return $query->getQuery()->getResult();
    }


    /**
     * 
     * @return Answer[] 
     */
    public function findAnswerIfNotVisible()
    {
        $query = $this->createQueryBuilder('r')
                      ->orderBy('r.createdAt', 'DESC')
                      ->where('r.visible = 0');
        return $query->getQuery()->getResult();
    }


     /**
     * @return Answer[] 
     */
    public function approvedAnswer()
    {
        $query = $this->createQueryBuilder('a')
                      ->orderBy('a.approve', 'DESC');
        return $query->getQuery()->getResult();
    }
}

