Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A56FF3D759C
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 15:09:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D0B83C911D
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 15:09:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5D8663C57B2
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 15:09:06 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B06C0200D01
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 15:09:05 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 139BD2011E;
 Tue, 27 Jul 2021 13:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627391345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zvql7JYpjXjiTkYOvVPw0ZI5q6k6ur53ZWK6FSgQ5t0=;
 b=WPCNUOuGOQ/ffV/4r6lKAA2PweqlTimI/JaKZekMaudhu3cbL8vUIeyr4pJkXQSs+4xMc7
 NcOgsj3TzNH2Vek6PBNmDEXBbvhZ5TWMbuYZvQ9yKM0zOQTJ/YmPPizYd8k0Yt/oc4hiAE
 ViQSNI8ls3kkUeCZkDLaRrFkV5NiJtU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627391345;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zvql7JYpjXjiTkYOvVPw0ZI5q6k6ur53ZWK6FSgQ5t0=;
 b=5C4mAWlSAdcmjSDntEE78HVPd9Ne4NGKo0yRatx828335iMndDO1BqCHHRMSQJYcO2rmdZ
 v42oe4KIcyEqIQDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F0CD01377D;
 Tue, 27 Jul 2021 13:09:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wbJqOXAFAGHePQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 27 Jul 2021 13:09:04 +0000
Date: Tue, 27 Jul 2021 15:09:05 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YQAFcVwvz+eXGOsk@yuki>
References: <20210719092239.GA1475@atcfdc88> <YPgxJwx795fhXgLa@pevik>
 <62262681-222f-8d09-a100-0d7be0c7526f@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62262681-222f-8d09-a100-0d7be0c7526f@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4,
 2/2] cgroup/cgroup_regression_test: Fix umount failure
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
Cc: richiejp@f-m.fm, Alan Quey-Liang Kao <alankao@andestech.com>, metan@ucw.cz,
 ycliang@cs.nctu.edu.tw, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I had a first look at this patches and was curious, what the reasoning 
> behind the "/" is.
> The comment you suggest is wrong. The / was introduced to prevent 
> unmounting some other mountpoint,
> where the device was cgroup.
> Imho the approach of adding a / to the end was wrong and intransparent. 
> I would rather use "./cgroup" or "$PWD/cgroup".

Passing full path to the cgroup directory sound much safer to me
especially when the directory name is just 'cgroup', try it yourself:

device=cgroup/; grep "${device%/}" /proc/mounts

On my machine this yields 10 lines and 21 matches.

> If possible, I'd actually change tst_umount, to always unmount the 
> mountpoint and not the device, i.e. if the given path is not an absolute 
> path, make it absolute (e.g. by prepending $PWD").
> This way the check if the mountpoint exist wouldn't be the fuzzy thing 
> it is right now.

Strongly agree here.

I would go even one step further and change the library so that it
rejects anything that does not start with '/'.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
