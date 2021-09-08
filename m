Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE4D403C55
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Sep 2021 17:12:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8BDEA3C86D6
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Sep 2021 17:12:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 975273C222D
 for <ltp@lists.linux.it>; Wed,  8 Sep 2021 17:12:52 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 532EF1A01177
 for <ltp@lists.linux.it>; Wed,  8 Sep 2021 17:12:51 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7D9AF20164;
 Wed,  8 Sep 2021 15:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631113970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1JcT30e/F0FVG0P2PrkQ62J0kUsL+pEIXNbbNA3KYv4=;
 b=uy/0k0+386r7hNP03FrnK5l9It3Nk53/hlkmchSfJa1zi661h3ZsDAP7yJQItXqoyK5faF
 22FBNpqZKuRug6NSm771C2rgcr43aOtvGvYYHx4ncigzYlpdC6Ns1EXeoK6o8XsP3cwhsj
 BhtSeF6UEb6j17xhwk+EoELNqSKuVtg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631113970;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1JcT30e/F0FVG0P2PrkQ62J0kUsL+pEIXNbbNA3KYv4=;
 b=/u0Ke3YYkd9LR2yEDq8xxKappniDdxFZEHKodZW8ATzvnHuHarz25mEGln2w86dQbQjvlQ
 4uja4tyrgqhlgWAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 68B7513D0B;
 Wed,  8 Sep 2021 15:12:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rgOJGfLSOGG8IQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 08 Sep 2021 15:12:50 +0000
Date: Wed, 8 Sep 2021 17:13:04 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YTjTAG4bFHce9QTu@yuki>
References: <20210720150520.17612-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210720150520.17612-1-krzysztof.kozlowski@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] controllers: detect previous test failure on
 cgroup mounts
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
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../kernel/controllers/cgroup_fj/cgroup_fj_common.sh   |  4 ++--
>  .../controllers/memcg/control/memcg_control_test.sh    | 10 ++++++----
>  .../controllers/memcg/stress/memcg_stress_test.sh      |  8 ++++----
>  3 files changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/testcases/kernel/controllers/cgroup_fj/cgroup_fj_common.sh b/testcases/kernel/controllers/cgroup_fj/cgroup_fj_common.sh
> index 5594fe9de426..53ab637e8910 100755
> --- a/testcases/kernel/controllers/cgroup_fj/cgroup_fj_common.sh
> +++ b/testcases/kernel/controllers/cgroup_fj/cgroup_fj_common.sh
> @@ -123,10 +123,10 @@ cleanup()
>      fi
>  
>      if grep -q "$mount_point" /proc/mounts; then
> -        umount "$mount_point"
> +        EXPECT_PASS umount "$mount_point"
>      fi
>  
>      if [ -e "$mount_point" ]; then
> -        rmdir "$mount_point"
> +        EXPECT_PASS rmdir "$mount_point"
>      fi
>  }
> diff --git a/testcases/kernel/controllers/memcg/control/memcg_control_test.sh b/testcases/kernel/controllers/memcg/control/memcg_control_test.sh
> index 4d9f1bb5d586..626f5e676831 100644
> --- a/testcases/kernel/controllers/memcg/control/memcg_control_test.sh
> +++ b/testcases/kernel/controllers/memcg/control/memcg_control_test.sh
> @@ -53,6 +53,8 @@ STATUS_PIPE="$TMP/status_pipe"
>  PASS=0
>  FAIL=1
>  
> +. test.sh

We cannot casually include the test.sh in testcases that does not use
the shell library as that will change the behavior of the tst_ commands.

Due to historicall reason we have two sets of tst_resm/tst_brkm/..., one
set are actuall binaries with the tst_foo name and the second set is
provided by the test.sh library. It's unfortunate but the binary
commands are still used in a few places and it's hard to even find out
where, since we have to look for shell scripts that does not source
(even indirectly test.sh) but use the tst_resm interfaces.

So unless you have reviewed the test carefully and made sure that it
works well with the test.sh library this will possibly introduce subtle
breakage.

The changes in the other two shell scripts looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
