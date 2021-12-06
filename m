Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB9D46996D
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Dec 2021 15:48:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7A76A3C2349
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Dec 2021 15:48:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 638F53C19DA
 for <ltp@lists.linux.it>; Mon,  6 Dec 2021 15:47:59 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5D03C6005E0
 for <ltp@lists.linux.it>; Mon,  6 Dec 2021 15:47:58 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 656261FD2F;
 Mon,  6 Dec 2021 14:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1638802078; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UkjNnknWJolrpvXoWMqYdZisRCIO0TdAjSi/P8egbEc=;
 b=dMd0PnUt+OgLA319C9oE0t2djlvJW13uRDGFOTl4bEHDvCr22tHWMDjwRvf9IkxSXgmtQX
 qKwHXP9PTCk1893vYAEYAm7uQW8LLNgSBJlCqOvmutdTlAy6i1CaTX386uCrrYfIp7ldiV
 +Sk5mjumqNG+oA94jykSFBLcjhX0o5A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1638802078;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UkjNnknWJolrpvXoWMqYdZisRCIO0TdAjSi/P8egbEc=;
 b=9IYBjuD5/zsUua++AwpZXvTxg5ZHumxW240I7oG532TYE187fdxoccDExWySLroqBnXQBT
 thEswOTmPaIShjAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4476F13BBC;
 Mon,  6 Dec 2021 14:47:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pzJTD54irmGdRAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 06 Dec 2021 14:47:58 +0000
Date: Mon, 6 Dec 2021 15:49:13 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <Ya4i6ZCt0Aj/oU2J@yuki>
References: <20211201160954.16442-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211201160954.16442-1-andrea.cervesato@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Refactoring aiodio_append.c using LTP API
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> -int read_eof(char *filename)
> +static void read_eof(const char *filename, size_t bs)
>  {
>  	int fd;
> -	int i;
>  	int r;
> -	char buf[4096];
> +	char *bufptr;
>  
> -	while ((fd = open(filename, O_RDONLY)) < 0) {
> -		sleep(1);	/* wait for file to be created */
> -	}
> +	while ((fd = open(filename, O_RDONLY, 0666)) < 0)
> +		usleep(100);
> +
> +	bufptr = SAFE_MEMALIGN(getpagesize(), bs);
>  
> -	for (i = 0; i < 1000000; i++) {
> +	tst_res(TINFO, "child %i reading file", getpid());
> +	while (*run_child) {
>  		off_t offset;
>  		char *bufoff;
>  
> -		offset = lseek(fd, SEEK_END, 0);
> -		r = read(fd, buf, 4096);
> -		if (r > 0) {
> -			if ((bufoff = check_zero(buf, r))) {
> -				fprintf(stderr, "non-zero read at offset %p\n",
> -					offset + bufoff);
> -				exit(1);
> +		offset = SAFE_LSEEK(fd, 0, SEEK_END);
> +		do {
> +			r = SAFE_READ(0, fd, bufptr, bs);
> +			if (r > 0) {
> +				bufoff = check_zero(bufptr, r);
> +				if (bufoff) {
> +					tst_res(TINFO, "non-zero read at offset %zu",
> +						offset + (bufoff - bufptr));
> +					free(bufptr);
> +					SAFE_CLOSE(fd);
> +					return;
> +				}
> +				offset += r;
>  			}
> -		}
> +		} while (r > 0);
>  	}
> -	return 0;
> -}
>  
> -#define NUM_AIO 16
> -#define AIO_SIZE 64*1024
> +	free(bufptr);
> +	SAFE_CLOSE(fd);
> +}

This looks like another version of the function that reads a file in a
loop until told to stop. Can we please have a single instance of that in
a header?

>  /*
>   * append to the end of a file using AIO DIRECT.
>   */
> -void aiodio_append(char *filename)
> +static void aiodio_append(char *filename, int bcount)
>  {
>  	int fd;
>  	void *bufptr;
> @@ -91,21 +84,13 @@ void aiodio_append(char *filename)
>  	struct io_event event;
>  	struct timespec timeout;
>  
> -	fd = open(filename, O_DIRECT | O_WRONLY | O_CREAT, 0666);
> -	if (fd < 0) {
> -		perror("cannot create file");
> -		return;
> -	}
> +	fd = SAFE_OPEN(filename, O_DIRECT | O_WRONLY | O_CREAT, 0666);
>  
>  	memset(&myctx, 0, sizeof(myctx));
>  	io_queue_init(NUM_AIO, &myctx);
>  
>  	for (i = 0; i < NUM_AIO; i++) {
> -		TEST(posix_memalign(&bufptr, 4096, AIO_SIZE));
> -		if (TEST_RETURN) {
> -			tst_resm(TBROK | TRERRNO, "cannot malloc aligned memory");
> -			return;
> -		}
> +		bufptr = SAFE_MEMALIGN(getpagesize(), AIO_SIZE);
>  		memset(bufptr, 0, AIO_SIZE);
>  		io_prep_pwrite(&iocb_array[i], fd, bufptr, AIO_SIZE, offset);
>  		iocbs[i] = &iocb_array[i];
> @@ -115,14 +100,14 @@ void aiodio_append(char *filename)
>  	/*
>  	 * Start the 1st NUM_AIO requests
>  	 */
> -	if ((w = io_submit(myctx, NUM_AIO, iocbs)) < 0) {
> -		fprintf(stderr, "io_submit write returned %d\n", w);
> -	}
> +	w = io_submit(myctx, NUM_AIO, iocbs);
> +	if (w < 0)
> +		tst_brk(TBROK, "io_submit: %s", tst_strerrno(-w));
>  
>  	/*
>  	 * As AIO requests finish, keep issuing more AIOs.
>  	 */
> -	for (; i < 1000; i++) {
> +	for (; i < bcount; i++) {
>  		int n = 0;
>  		struct iocb *iocbp;
>  
> @@ -131,56 +116,69 @@ void aiodio_append(char *filename)
>  			iocbp = (struct iocb *)event.obj;
>  
>  			if (n > 0) {
> -				io_prep_pwrite(iocbp, fd, iocbp->u.c.buf,
> -					       AIO_SIZE, offset);
> +				io_prep_pwrite(iocbp, fd, iocbp->u.c.buf, AIO_SIZE, offset);
>  				offset += AIO_SIZE;
> -				if ((w = io_submit(myctx, 1, &iocbp)) < 0) {
> -					fprintf(stderr,
> -						"write %d returned %d\n", i, w);
> -				}
> +				w = io_submit(myctx, 1, &iocbp);
> +				if (w < 0)
> +					tst_brk(TBROK, "io_submit: %s", tst_strerrno(-w));
>  			}
>  		}
>  	}
>  }
>  
> -int main(int argc, char **argv)
> +static void setup(void)
> +{
> +	run_child = SAFE_MMAP(NULL, sizeof(int), PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
> +}
> +
> +static void cleanup(void)
>  {
> -	int pid[NUM_CHILDREN];
> -	int num_children = 1;
> +	SAFE_MUNMAP(run_child, sizeof(int));
> +}
> +
> +static void run(void)
> +{
> +	char *filename = "file";
> +	int filesize = FILE_SIZE;
> +	int num_children = NUM_CHILDREN;
> +	int status;
>  	int i;
> -	char *filename = argv[1];
>  
> -	printf("Starting aio/dio append test...\n");
> +	*run_child = 1;
>  
>  	for (i = 0; i < num_children; i++) {
> -		if ((pid[i] = fork()) == 0) {
> -			/* child */
> -			return read_eof(filename);
> -		} else if (pid[i] < 0) {
> -			/* error */
> -			perror("fork error");
> -			break;
> -		} else {
> -			/* Parent */
> -			continue;
> +		if (!SAFE_FORK()) {
> +			read_eof(filename, filesize);
> +			return;
>  		}
>  	}
>  
> -	/*
> -	 * Parent appends to end of file using direct i/o
> -	 */
> +	tst_res(TINFO, "Parent append to file");
>  
> -	aiodio_append(filename);
> +	aiodio_append(filename, 1000);
>  
> -	for (i = 0; i < num_children; i++) {
> -		kill(pid[i], SIGTERM);
> -	}
> +	if (SAFE_WAITPID(-1, &status, WNOHANG))
> +		tst_res(TFAIL, "Non zero bytes read");
> +	else
> +		tst_res(TPASS, "All bytes read were zeroed");
>  
> -	return 0;
> +	*run_child = 0;
>  }
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.needs_tmpdir = 1,
> +	.forks_child = 1,
> +};
>  #else
> -int main(void)
> +static void run(void)
>  {
> -	tst_brkm(TCONF, NULL, "test requires libaio and it's development packages");
> +	tst_res(TCONF, "test requires libaio and it's development packages");
>  }
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +};

We do have a shorthand macro for this:

TST_TEST_TCONF("test requires libaio and it's development packages");

>  #endif
> -- 
> 2.34.0
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
