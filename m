Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D0C48E789
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jan 2022 10:31:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0EF8D3C9536
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jan 2022 10:31:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 067773C862B
 for <ltp@lists.linux.it>; Fri, 14 Jan 2022 10:31:17 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 67FE9600CC2
 for <ltp@lists.linux.it>; Fri, 14 Jan 2022 10:31:16 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 64DD81F3CE;
 Fri, 14 Jan 2022 09:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1642152676; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UiGtuOrojV8AZ52DqkdeHzoS2AN1n0W90JkZ6lv4Ni8=;
 b=Rcy9AgPCgDk6KGdsEGA3co4yM45cluh6bdyoJuaoQE4T3BsL91oScNLaADTiHLXS3NKwBh
 I0e1s2mM5SgTPquncTgjYFOzvRkitnCLpTVZpcz31G0Y5Z4KhbETyFuxLDSbsdp9ps48TE
 +ffhtr2uQpgM73v/y+EcPk7zPt0JHUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1642152676;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UiGtuOrojV8AZ52DqkdeHzoS2AN1n0W90JkZ6lv4Ni8=;
 b=HYTIVjOUzLiOGxczzZbJhx2xouYeDZHvW+WQNLKKzefm33txAOgH35UX+NgopybCtafLKn
 K3uYYQTg1UI7ftAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4F6FA13EC6;
 Fri, 14 Jan 2022 09:31:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hvEsEuRC4WE9EQAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Fri, 14 Jan 2022 09:31:16 +0000
Message-ID: <9813e92e-da52-dcfc-3eca-930854fb754e@suse.cz>
Date: Fri, 14 Jan 2022 10:31:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Nikita Yushchenko <nikita.yushchenko@virtuozzo.com>, ltp@lists.linux.it
References: <20220112161942.4065665-1-nikita.yushchenko@virtuozzo.com>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <20220112161942.4065665-1-nikita.yushchenko@virtuozzo.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] nfs_flock: fail the test if lock/unlock ops fail
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

On 12. 01. 22 17:19, Nikita Yushchenko via ltp wrote:
> Since nfs_flock is testing locking operations, ignoring errors returned
> from those operations is nonsense.
> 
> Signed-off-by: Nikita Yushchenko <nikita.yushchenko@virtuozzo.com>
> ---
>  testcases/network/nfs/nfslock01/nfs_flock.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/testcases/network/nfs/nfslock01/nfs_flock.c b/testcases/network/nfs/nfslock01/nfs_flock.c
> index a7673c751..a13ddd251 100644
> --- a/testcases/network/nfs/nfslock01/nfs_flock.c
> +++ b/testcases/network/nfs/nfslock01/nfs_flock.c
> @@ -63,16 +63,20 @@ int main(int argc, char **argv)
>  				continue;
>  		}
>  
> -		if (writeb_lock(fd, offset, SEEK_SET, BYTES) < 0)
> -			printf("failed in writeb_lock, Errno = %d", errno);
> +		if (writeb_lock(fd, offset, SEEK_SET, BYTES) < 0) {
> +			printf("failed in writeb_lock, Errno = %d\n", errno);
> +			exit(1);
> +		}
>  
>  		lseek(fd, offset, SEEK_SET);
>  
>  		/* write to the test file */
>  		write(fd, buf, BYTES);
>  
> -		if (unb_lock(fd, offset, SEEK_SET, BYTES) < 0)
> -			printf("failed in unb_lock, Errno = %d", errno);
> +		if (unb_lock(fd, offset, SEEK_SET, BYTES) < 0) {
> +			printf("failed in unb_lock, Errno = %d\n", errno);
> +			exit(1);
> +		}
>  	}
>  	exit(0);
>  }

The test program is quite short and simple. Why not rewrite it using the
current LTP API and make it even better? Some useful links to help with
that:

https://github.com/linux-test-project/ltp/wiki/C-Test-Case-Tutorial
https://github.com/linux-test-project/ltp/wiki/C-Test-API
https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
