<?php

namespace App\Repository;

use App\Entity\Question;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;

/**
 * @method Question|null find($id, $lockMode = null, $lockVersion = null)
 * @method Question|null findOneBy(array $criteria, array $orderBy = null)
 * @method Question[]    findAll()
 * @method Question[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class QuestionRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Question::class);
    }

    /**
     * @return Question[] 
     */
    public function findAllQuestions()
    {
        $query = $this->createQueryBuilder('q')
                      ->orderBy('q.createdAt', 'DESC');
        return $query->getQuery()->getResult();
    }



    /**
     * @return Question[]
     * 
     * Paginator Query 
     */
    public function findAllQuestionsPaginate()
    {
        $query = $this->createQueryBuilder('q')
                      ->orderBy('q.createdAt', 'DESC');
        return $query->getQuery();
    }




     /**
     * 
     * @return Question[] 
     */
    public function findQuestionIfVisible()
    {
        $query = $this->createQueryBuilder('q')
                      ->orderBy('q.createdAt', 'DESC')
                      ->where('q.visible = 1');
        return $query->getQuery()->getResult();
    }


    /**
     * 
     * @return Question[] 
     */
    public function findQuestionIfNotVisible()
    {
        $query = $this->createQueryBuilder('q')
                      ->orderBy('q.createdAt', 'DESC')
                      ->where('q.visible = 0');
        return $query->getQuery()->getResult();
    }

}
