Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0C6D3BE9
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 11:08:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2718A3C1508
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 11:08:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 12FFE3C1421
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 11:08:56 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6A5CC200DF4
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 11:08:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 987F5B1BA;
 Fri, 11 Oct 2019 09:08:54 +0000 (UTC)
Date: Fri, 11 Oct 2019 11:08:52 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20191011090852.GA2591@rei>
References: <20190924114412.61462-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190924114412.61462-1-lkml@jv-coder.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] shm_test: Fix parameter passing to threads
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> The arguments to all threads were passed using a pointer to the same memory.
> So they all point to the same data, that is overriden by the main thread
> to prepare it for the next thread.

Good catch, a few comments below.

> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> ---
>  testcases/kernel/mem/mtest07/shm_test.c | 70 ++++++++++++-------------
>  1 file changed, 35 insertions(+), 35 deletions(-)
> 
> diff --git a/testcases/kernel/mem/mtest07/shm_test.c b/testcases/kernel/mem/mtest07/shm_test.c
> index de91b7427..852c51b43 100644
> --- a/testcases/kernel/mem/mtest07/shm_test.c
> +++ b/testcases/kernel/mem/mtest07/shm_test.c
> @@ -81,8 +81,16 @@ void noprintf(char *string, ...)
>  
>  #define MAXT	30		/* default number of threads to create.               */
>  #define MAXR	1000		/* default number of repatetions to execute           */
> -#define WRITER  0		/* cause thread function to shmat and write           */
> -#define READER  1		/* cause thread function to shmat and read            */
> +
> +struct child_args
> +{
> +	pthread_t threadid;
> +	int num_reps;
> +	int shmkey;
> +	int map_size;
> +	int isReader;

Mixed case is frowned upon in LKML coding style, so this should be
is_reader instead.

> +};
> +
>  
>  /******************************************************************************/
>  /*								 	      */
> @@ -166,28 +174,25 @@ static int rm_shared_mem(key_t shm_id,	/* id of shared memory segment to be remo
>  /* Return:	exits with -1 on error, 0 on success                          */
>  /*									      */
>  /******************************************************************************/
> -static void *shmat_rd_wr(void *args)
> +static void *shmat_rd_wr(void *vargs)
>  {				/* arguments to the thread function             */
>  	int shmndx = 0;		/* index to the number of attach and detach   */
>  	int index = 0;		/* index to the number of blocks touched      */
> -	int reader = 0;		/* this thread is a reader thread if set to 1 */
>  	key_t shm_id = 0;	/* shared memory id                           */
> -	long *locargs =		/* local pointer to arguments                 */
> -	    (long *)args;
> +	struct child_args *args = (struct child_args *)vargs;
                                   ^
				   This cast is useless in C.

>  	volatile int exit_val = 0;	/* exit value of the pthread                  */
>  	char *read_from_mem;	/* ptr to touch each (4096) block in memory   */
>  	char *write_to_mem;	/* ptr to touch each (4096) block in memory   */
>  	char *shmat_addr;	/* address of the attached memory             */
>  	char buff;		/* temporary buffer                           */
>  
> -	reader = (int)locargs[3];
> -	while (shmndx++ < (int)locargs[0]) {
> +	while (shmndx++ < args->num_reps) {
>  		dprt("pid[%d]: shmat_rd_wr(): locargs[1] = %#x\n",
> -		     getpid(), (int)locargs[1]);
> +		     getpid(), args->shmkey);
>  
>  		/* get shared memory id */
>  		if ((shm_id =
> -		     shmget((int)locargs[1], (int)locargs[2], IPC_CREAT | 0666))
> +		     shmget(args->shmkey, args->map_size, IPC_CREAT | 0666))
>  		    == -1) {
>  			dprt("pid[%d]: shmat_rd_wr(): shmget failed\n",
>  			     getpid());
> @@ -213,11 +218,11 @@ static void *shmat_rd_wr(void *args)
>  			"pid[%d]: do_shmat_shmadt(): got shmat address = %#lx\n",
>  			getpid(), (long)shmat_addr);
>  
> -		if (!reader) {
> +		if (args->isReader) {
>  			/* write character 'Y' to that memory area */
>  			index = 0;
>  			write_to_mem = shmat_addr;
> -			while (index < (int)locargs[2]) {
> +			while (index < args->num_reps) {

Isn't locargs[2] map_size, or did I miss something?

>  				dprt("pid[%d]: do_shmat_shmatd(): write_to_mem = %#x\n", getpid(), write_to_mem);
>  				*write_to_mem = 'Y';
>  				index++;
> @@ -228,7 +233,7 @@ static void *shmat_rd_wr(void *args)
>  			/* read from the memory area */
>  			index = 0;
>  			read_from_mem = shmat_addr;
> -			while (index < (int)locargs[2]) {
> +			while (index < args->num_reps) {

Here as well.

>  				buff = *read_from_mem;
>  				index++;
>  				read_from_mem++;
> @@ -272,12 +277,11 @@ int main(int argc,		/* number of input parameters                 */
>  	int c;			/* command line options                       */
>  	int num_thrd = MAXT;	/* number of threads to create                */
>  	int num_reps = MAXR;	/* number of repatitions the test is run      */
> -	int thrd_ndx;		/* index into the array of thread ids         */
> +	int i;
>  	void *th_status;	/* exit status of LWP's                       */
>  	int map_size;		/* size of the file mapped.                   */
>  	int shmkey = 1969;	/* key used to generate shmid by shmget()     */
> -	pthread_t thrdid[30];	/* maxinum of 30 threads allowed              */
> -	long chld_args[4];	/* arguments to the thread function           */
> +	struct child_args chld_args[30];	/* arguments to the thread function */
>  	char *map_address = NULL;
>  	/* address in memory of the mapped file       */
>  	extern int optopt;	/* options to the program                     */
> @@ -299,7 +303,7 @@ int main(int argc,		/* number of input parameters                 */
>  		case 't':
>  			if ((num_thrd = atoi(optarg)) == 0)
>  				OPT_MISSING(argv[0], optopt);
> -			else if (num_thrd < 0) {
> +			else if (num_thrd < 0 || num_thrd > MAXT) {
>  				fprintf(stdout,
>  					"WARNING: bad argument. Using default\n");
>  				num_thrd = MAXT;
> @@ -311,31 +315,27 @@ int main(int argc,		/* number of input parameters                 */
>  		}
>  	}
>  
> -	chld_args[0] = num_reps;
> -
> -	for (thrd_ndx = 0; thrd_ndx < num_thrd; thrd_ndx += 2) {
> +	for (i = 0; i < num_thrd; i += 2) {
>  		srand(time(NULL) % 100);
> -		map_size =
> -		    (1 + (int)(1000.0 * rand() / (RAND_MAX + 1.0))) * 4096;
> -
> -		chld_args[1] = shmkey++;
> -		chld_args[2] = map_size;
> +		map_size = (1 + (int)(1000.0 * rand() / (RAND_MAX + 1.0))) * 4096;
>  
>  		dprt("main(): thrd_ndx = %d map_address = %#x map_size = %d\n",
> -		     thrd_ndx, map_address, map_size);
> -
> -		chld_args[3] = WRITER;
> +		     i, map_address, map_size);
>  
> +		chld_args[i].num_reps = num_reps;
> +		chld_args[i].map_size = map_size;
> +		chld_args[i].shmkey = shmkey++;
> +		chld_args[i].isReader = 0;
>  		if (pthread_create
> -		    (&thrdid[thrd_ndx], NULL, shmat_rd_wr, chld_args)) {
> +		    (&chld_args[i].threadid, NULL, shmat_rd_wr, &chld_args[i])) {
>  			perror("shmat_rd_wr(): pthread_create()");
>  			exit(-1);
>  		}
>  
> -		chld_args[3] = READER;
> -
> +		chld_args[i + 1] = chld_args[i];
> +		chld_args[i + 1].isReader = 1;
>  		if (pthread_create
> -		    (&thrdid[thrd_ndx + 1], NULL, shmat_rd_wr, chld_args)) {
> +		    (&chld_args[i + 1].threadid, NULL, shmat_rd_wr, &chld_args[i + 1])) {
>  			perror("shmat_rd_wr(): pthread_create()");
>  			exit(-1);
>  		}
> @@ -343,8 +343,8 @@ int main(int argc,		/* number of input parameters                 */
>  
>  	sync();
>  
> -	for (thrd_ndx = 0; thrd_ndx < num_thrd; thrd_ndx++) {
> -		if (pthread_join(thrdid[thrd_ndx], &th_status) != 0) {
> +	for (i = 0; i < num_thrd; i++) {
> +		if (pthread_join(chld_args[i].threadid, &th_status) != 0) {
>  			perror("shmat_rd_wr(): pthread_join()");
>  			exit(-1);
>  		} else {
> @@ -352,7 +352,7 @@ int main(int argc,		/* number of input parameters                 */
>  			if (th_status == (void *)-1) {
>  				fprintf(stderr,
>  					"thread [%ld] - process exited with errors\n",
> -					(long)thrdid[thrd_ndx]);
> +					(long)chld_args[i].threadid);
>  				exit(-1);
>  			}
>  		}
> -- 
> 2.20.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
