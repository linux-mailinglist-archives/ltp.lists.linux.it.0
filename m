Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 760446D17B4
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Mar 2023 08:45:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE0213CC973
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Mar 2023 08:45:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5EA633CB7E2
 for <ltp@lists.linux.it>; Fri, 31 Mar 2023 08:45:11 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B02AF1000BD4
 for <ltp@lists.linux.it>; Fri, 31 Mar 2023 08:45:10 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 146A31FE3C;
 Fri, 31 Mar 2023 06:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680245110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DANBQpFrQzSIflWH8M0MZmpWJ/aUjL6lcwKfjjHO5Fg=;
 b=KofNwk6aSs+cMJGGgDvlT59x973lxpM9xS+fyo/RQORUGntM7IapLos3cd0HGazHmZ59gm
 p8zGGBD0kbheJxYRBzHZY7yjf5Xl5dA815m8RJVvEyUnaRyp8DxLr13cP8k0HfGNrkfIBZ
 YUN03PEuGtvpg854g+JShe4ECseOTv8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680245110;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DANBQpFrQzSIflWH8M0MZmpWJ/aUjL6lcwKfjjHO5Fg=;
 b=2e0NaEk91i5fAIZmLDydg5g++RAlI/sA/i/R75axcubTlJaQn0R6d/G7b0BTzPyxjauVgd
 ko2Hw9libDnYj3Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 614FF133B6;
 Fri, 31 Mar 2023 06:45:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ceToDXWBJmSGYQAAMHmgww
 (envelope-from <akumar@suse.de>); Fri, 31 Mar 2023 06:45:09 +0000
From: Avinesh Kumar <akumar@suse.de>
To: Edward Liaw <edliaw@google.com>
Date: Fri, 31 Mar 2023 12:15:07 +0530
Message-ID: <12180793.O9o76ZdvQC@localhost>
Organization: SUSE
In-Reply-To: <20230331000747.2294390-1-edliaw@google.com>
References: <20230331000747.2294390-1-edliaw@google.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] setpgid02: use 1 instead of getpgid(1)
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
Cc: kernel-team@android.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Edward,

On Friday, March 31, 2023 5:37:47 AM IST Edward Liaw via ltp wrote:
> On Android, init does not setpgid, so getpgid(1) returns 0 and the third
> case of setting pgid to a different session's process group does not
> behave as expected: setpgid treats 0 as setting the pgid to the pid.
> 
> Instead, replace SAFE_GETPGID(1) with the expected value of 1.
> 
> Signed-off-by: Edward Liaw <edliaw@google.com>
> ---
>  testcases/kernel/syscalls/setpgid/setpgid02.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/syscalls/setpgid/setpgid02.c b/testcases/kernel/syscalls/setpgid/setpgid02.c
> index 4b63afee8..bf7b3176b 100644
> --- a/testcases/kernel/syscalls/setpgid/setpgid02.c
> +++ b/testcases/kernel/syscalls/setpgid/setpgid02.c
> @@ -44,7 +44,7 @@ static void setup(void)
>  	 * Getting pgid of init/systemd process to use it as a
>  	 * process group from a different session for EPERM test
>  	 */
> -	init_pgid = SAFE_GETPGID(1);
> +	init_pgid = 1;
>  }
>  
>  static void run(unsigned int n)
> 
This looks fine.
Reviewed-by: Avinesh Kumar <akumar@suse.de>

Regards,
Avinesh



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
