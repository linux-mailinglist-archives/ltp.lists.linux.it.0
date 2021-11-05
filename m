Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FB24460A9
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 09:29:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A7DB3C736A
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 09:29:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2F92F3C55CE
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 09:29:28 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AC8F86009EC
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 09:29:27 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D7C9C1FD36;
 Fri,  5 Nov 2021 08:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1636100966;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nzkkp+NJ+u6pYVohrsUmcNySbWjjcNz6q1ZuCYiZIXw=;
 b=XQjCm+QXmU4STiqRvWhqmAUDBqQVENu0IoIqeVK2wb1BOgYSEfSC9aFPrE+oGsZZXw7JEM
 PbgpJesFSMQxCim7DFV5Vkk7nn4aCV5FbrP+zqFvvcY2qhko4FK4RGS6KmRhwLT1hrVI2J
 A/HuX6/911wsy4aK4OaFNOznUX/MzpA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1636100966;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nzkkp+NJ+u6pYVohrsUmcNySbWjjcNz6q1ZuCYiZIXw=;
 b=pO8Rl+zPF1yntWi6y8baaSqcQJ2o1QMXncVnFxbe6nYvXOfbyxoKrwIKhv6TArV+yhmppL
 +BWK8vbWDh+EmCAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A95C713DFC;
 Fri,  5 Nov 2021 08:29:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jIi9J2brhGEDSQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 05 Nov 2021 08:29:26 +0000
Date: Fri, 5 Nov 2021 09:29:25 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <YYTrZa/SEZfqANTn@pevik>
References: <7c11918db7c34d3aa0af98cb42b7970e@huawei.com>
 <YYSenZxvAG0Xgm71@google.com>
 <CAOQ4uxgN2Wx6aAcWYqSO_LNir5hTpAYhPEXHQPqhkQcpeHCPkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxgN2Wx6aAcWYqSO_LNir5hTpAYhPEXHQPqhkQcpeHCPkQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/fanotify: Kill the child process before
 exit
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Matthew Bobrowski <repnop@google.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

...
> This would be the obvious solution.
> But simpler to skip zero values then stop the iterator.
+1
> This makes the cleanup helper reenetrant:

> static int stop_children(void)
> {
>         int child_ret;
>         int i, ret = 0;

>         for (i = 0; i < MAX_CHILDREN; i++) {
>                 if (!child_pid[i]) continue;
>                 SAFE_KILL(child_pid[i], SIGKILL);
>         }
>         for (i = 0; i < MAX_CHILDREN; i++) {
>                 if (!child_pid[i]) continue;
>                 SAFE_WAITPID(child_pid[i], &child_ret, 0);
>                 if (!WIFSIGNALED(child_ret))
>                         ret = 1;
>                 child_pid[i] = 0;
>        }

>         return ret;
> }

Amir, thanks! Zhao, could you please test this in your setup?
(+ please be verbose about your setup, it helps to decide in the future that fix
is still needed).

Kind regards,
Petr

> Thanks,
> Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
