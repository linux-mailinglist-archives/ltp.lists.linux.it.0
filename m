Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3113DEF35
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 15:43:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0864F3C8892
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 15:43:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1F6EB3C56BD
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 15:43:43 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2A188200C08
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 15:43:42 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 55C40220CE;
 Tue,  3 Aug 2021 13:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627998222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RTfbbAFVvUuuAhH2UxhOcJa1+iJuk3jz9WJw6A/UqDQ=;
 b=ggyFZ8WqFScd86DY4TyzFPRjskHVy19o/WjnACtYsiUFioOkencNkuPfr0RxoLKBSEzBew
 blAvyvyw/2PGWTZxqqRfiSKPGiDvx0QSA6RNHyjmsWvV+H8M8Hy1wv+IxJV+QtwvXyP1vW
 a0wTWMG8sSNs5mBXz8k+ww3xupbDdOw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627998222;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RTfbbAFVvUuuAhH2UxhOcJa1+iJuk3jz9WJw6A/UqDQ=;
 b=tTg5sbTNFN6BzzkkeUp6x3rnvEaCRy4hTVTVuLFkeKSCJCanZnuEkTWpdsq9qc5Xfa8Fxz
 RQaHzf8rG8R/1yCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3C02213CEF;
 Tue,  3 Aug 2021 13:43:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kcpDDg5ICWESdAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 03 Aug 2021 13:43:42 +0000
Date: Tue, 3 Aug 2021 15:43:49 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Dai Shili <daisl.fnst@fujitsu.com>
Message-ID: <YQlIFagVIrWXjmgY@yuki>
References: <1627624085-16182-1-git-send-email-daisl.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1627624085-16182-1-git-send-email-daisl.fnst@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/readv02: Convert to new API and merge
 readv03 into readv02.
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
> -	/* Test case #1 */
> +static struct iovec rd_iovec[MAX_IOVEC] = {
>  	{buf2, -1},
>  	{(buf2 + CHUNK), CHUNK},
>  	{(buf2 + CHUNK * 2), CHUNK},
> -
> -	/* Test case #2 */
>  	{(buf2 + CHUNK * 3), G_1},
>  	{(buf2 + CHUNK * 4), G_1},
>  	{(buf2 + CHUNK * 5), G_1},
> -
> -	/* Test case #3 */
>  	{(caddr_t) - 1, CHUNK},
>  	{(buf2 + CHUNK * 6), CHUNK},
>  	{(buf2 + CHUNK * 8), CHUNK},
> -
> -	/* Test case #4 */
> -	{(buf2 + CHUNK * 9), CHUNK}
> +	{(buf2 + CHUNK * 9), CHUNK},
> +	{buf1, K_1}
>  };

It would be much easier to read the code if we split this iovec so that
each test has it's own structure. There is absolutely no reason to keep
them all together like that.

I.e. we will have it as:

static struct iovec invalid_iovec[] = {
	{buf, -1},
	{buf + CHUNK, CHUNK},
	{buf + 2*CHUNK, CHUNK},
};

static struct iovec large_iovec[] = {
	{buf2, G_1},
	{buf2 + CHUNK, G_1},
	{buf2 + CHUNK*2, G_1},
};

static struct iovec efault_iovec[] = {
	{NULL, CHUNK},
	{buf + CHUNK, CHUNK},
	{buf + 2*CHUNK, CHUNK},
};

static struct iovec valid_iovec[] = {
	{buf, CHUNK},
};

Also we can use the valid iovec for both EISDIR and EBADFD.

static void setup(void)
{
	...
	efault_iovec[0].iov_base = tst_get_bad_addr(NULL);
	...
}

Also I do not think that we need three buffers, the buf3 is completely
unused and there is no point in having special buffer for badfd test
either.

> -char f_name[K_1];
> -
> -int fd[4];
> -char *buf_list[NBUFS];
> -
> -char *TCID = "readv02";
> -int TST_TOTAL = 1;
> -
> -char *bad_addr = 0;
> +static struct tcase {
> +	int *fd;
> +	void *buf;
> +	int count;
> +	int exp_error;
> +} tcases[] = {
> +	{&fd[0], rd_iovec, 1, EINVAL},
> +	{&fd[1], rd_iovec + 6, 3, EFAULT},
> +	{&fd[2], rd_iovec + 10, -1, EINVAL},
> +	{&fd[3], rd_iovec + 10, 1, EISDIR},
> +	{&badfd, rd_iovec + 9, 3, EBADF},
> +};
>  
> -int init_buffs(char **);
> -int fill_mem(char *, int, int);
> -long l_seek(int, long, int);
> -char *getenv();
> -void setup();
> -void cleanup();
>  
> -int main(int ac, char **av)
> +void fill_mem(char *c_ptr, int c1, int c2)
>  {
> -	int lc;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> +	int count;
>  
> -	/* The following loop checks looping state if -i option given */
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> +	for (count = 1; count <= K_1 / CHUNK; count++) {
> +		if (count & 0x01) /* if odd */
> +			memset(c_ptr, c1, CHUNK);
> +		else /* if even */
> +			memset(c_ptr, c2, CHUNK);
> +	}
> +	return;
> +}
>  
> -		/* reset tst_count in case we are looping */
> -		tst_count = 0;
> +void init_buffs(char *pbufs[])
> +{
> +	int i;
>  
> -//test1:
> -		if (readv(fd[0], rd_iovec, 1) < 0) {
> -			if (errno != EINVAL) {
> -				tst_resm(TFAIL, "readv() set an illegal errno:"
> -					 " expected: EINVAL, got %d", errno);
> -			} else {
> -				tst_resm(TPASS, "got EINVAL");
> -			}
> -		} else {
> -			tst_resm(TFAIL, "Error: readv returned a positive "
> -				 "value");
> +	for (i = 0; pbufs[i] != NULL; i++) {
> +		switch (i) {
> +		case 0:
> +		case 1:
> +			fill_mem(pbufs[i], 0, 1);
> +			break;
> +		case 2:
> +			fill_mem(pbufs[i], 1, 0);
> +			break;
> +		default:
> +			tst_brk(TBROK, "Error in init_buffs function");
>  		}
> +	}
> +	return;
> +}
>  
> -//test2:
> -		l_seek(fd[0], CHUNK * 6, 0);
> -		if (readv(fd[0], (rd_iovec + 6), 3) < 0) {
> -			if (errno != EFAULT) {
> -				tst_resm(TFAIL, "expected errno = EFAULT, "
> -					 "got %d", errno);
> -			} else {
> -				tst_resm(TPASS, "got EFAULT");
> -			}
> -			if (memcmp((buf_list[0] + CHUNK * 6),
> -				   (buf_list[1] + CHUNK * 6), CHUNK * 3) != 0) {
> -				tst_resm(TFAIL, "Error: readv() partially "
> -					 "overlaid buf[2]");
> -			}
> -		} else {
> -			tst_resm(TFAIL, "Error: readv returned a positive "
> -				 "value");
> -		}
> +static void verify_readv(unsigned int n)
> +{
> +	struct tcase *tc = &tcases[n];
>  
> -//test3:
> -		if (readv(fd[1], (rd_iovec + 9), 1) < 0) {
> -			if (errno != EBADF) {
> -				tst_resm(TFAIL, "expected errno = EBADF, "
> -					 "got %d", errno);
> -			} else {
> -				tst_resm(TPASS, "got EBADF");
> -			}
> -		} else {
> -			tst_resm(TFAIL, "Error: readv returned a positive "
> -				 "value");
> -		}
> +	TST_EXP_FAIL2(readv(*tc->fd, tc->buf, tc->count), tc->exp_error,
> +		"readv(%d, %p, %d)", *tc->fd, tc->buf, tc->count);
>  
> -//test4:
> -		l_seek(fd[0], CHUNK * 10, 0);
> -		if (readv(fd[0], (rd_iovec + 10), -1) < 0) {
> -			if (errno != EINVAL) {
> -				tst_resm(TFAIL, "expected errno = EINVAL, "
> -					 "got %d", errno);
> -			} else {
> -				tst_resm(TPASS, "got EINVAL");
> -			}
> -		} else {
> -			tst_resm(TFAIL, "Error: readv returned a positive "
> -				 "value");
> +	if (tc->exp_error == EFAULT) {
> +		if (memcmp((buf_list[0] + CHUNK * 6),
> +			(buf_list[1] + CHUNK * 6), CHUNK * 3)) {
> +		    tst_res(TFAIL, "Error: readv() partially overlaid buf[2]");
>  		}
> -
>  	}
> -	close(fd[0]);
> -	close(fd[1]);
> -	cleanup();
> -	tst_exit();
> -
>  }
>  
> -/*
> - * setup() - performs all ONE TIME setup for this test.
> - */
>  void setup(void)
>  {
> -	int nbytes;
> -
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -
> -	/* make a temporary directory and cd to it */
> -	tst_tmpdir();
> +	int i;
>  
>  	buf_list[0] = buf1;
>  	buf_list[1] = buf2;
> @@ -201,84 +133,37 @@ void setup(void)
>  
>  	init_buffs(buf_list);
>  
> -	sprintf(f_name, "%s.%d", DATA_FILE, getpid());
> +	for (i = 0; i < 3; i++) {
> +		fd[i] = SAFE_OPEN(TEST_FILE[i], O_WRONLY | O_CREAT, 0666);
> +		SAFE_WRITE(1, fd[i], buf_list[2], K_1);
>  
> -	if ((fd[0] = open(f_name, O_WRONLY | O_CREAT, 0666)) < 0) {
> -		tst_brkm(TBROK, cleanup, "open failed: fname = %s, "
> -			 "errno = %d", f_name, errno);
> -	} else {
> -		if ((nbytes = write(fd[0], buf_list[2], K_1)) != K_1) {
> -			tst_brkm(TBROK, cleanup, "write failed: nbytes "
> -				 "= %d " "errno = %d", nbytes, errno);
> -		}
> -	}
> +		SAFE_CLOSE(fd[i]);
>  
> -	SAFE_CLOSE(cleanup, fd[0]);
> -
> -	if ((fd[0] = open(f_name, O_RDONLY, 0666)) < 0) {
> -		tst_brkm(TBROK, cleanup, "open failed: fname = %s, "
> -			 "errno = %d", f_name, errno);
> +		fd[i] = SAFE_OPEN(TEST_FILE[i], O_RDONLY, 0666);
>  	}
> +	SAFE_LSEEK(fd[1], CHUNK * 6, 0);
> +	SAFE_LSEEK(fd[2], CHUNK * 10, 0);

Does these readv calls actually read anyting?

Because as far as I can tell they just fail without actually reading
anything, so there is no point in intializing the buffers and also there
is no point in having three different files opened for the test either.

> -	fd[1] = -1;		/* Invalid file descriptor */
> +	rd_iovec[6].iov_base = tst_get_bad_addr(NULL);
>  
> -	bad_addr = mmap(0, 1, PROT_NONE,
> -			MAP_PRIVATE_EXCEPT_UCLINUX | MAP_ANONYMOUS, 0, 0);
> -	if (bad_addr == MAP_FAILED) {
> -		tst_brkm(TBROK, cleanup, "mmap failed");
> -	}
> -	rd_iovec[6].iov_base = bad_addr;
> +	SAFE_MKDIR(TEST_DIR, MODES);
> +	fd[3] = SAFE_OPEN(TEST_DIR, O_RDONLY);
>  }
>  
> -/*
> - * cleanup() - performs all ONE TIME cleanup for this test at
> - *	       completion or premature exit.
> - */
> -void cleanup(void)
> -{
> -	SAFE_UNLINK(NULL, f_name);
> -	tst_rmdir();
> -
> -}
> -
> -int init_buffs(char *pbufs[])
> +static void cleanup(void)
>  {
>  	int i;
>  
> -	for (i = 0; pbufs[i] != NULL; i++) {
> -		switch (i) {
> -		case 0:
> -		 /*FALLTHROUGH*/ case 1:
> -			fill_mem(pbufs[i], 0, 1);
> -			break;
> -
> -		case 2:
> -			fill_mem(pbufs[i], 1, 0);
> -			break;
> -
> -		default:
> -			tst_brkm(TBROK, cleanup, "Error in init_buffs()");
> -		}
> -	}
> -	return 0;
> -}
> -
> -int fill_mem(char *c_ptr, int c1, int c2)
> -{
> -	int count;
> -
> -	for (count = 1; count <= K_1 / CHUNK; count++) {
> -		if (count & 0x01) {	/* if odd */
> -			memset(c_ptr, c1, CHUNK);
> -		} else {	/* if even */
> -			memset(c_ptr, c2, CHUNK);
> -		}
> +	for (i = 0; i < 4; i++) {
> +		if (fd[i] > 0)
> +			SAFE_CLOSE(fd[i]);
>  	}
> -	return 0;
>  }
>  
> -long l_seek(int fdesc, long offset, int whence)
> -{
> -	SAFE_LSEEK(cleanup, fdesc, offset, whence);
> -	return 0;
> -}
> +static struct tst_test test = {
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.needs_tmpdir = 1,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test = verify_readv,
> +};

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
