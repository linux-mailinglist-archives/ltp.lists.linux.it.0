Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D80453F3636
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 23:58:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 795153C4F3B
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 23:58:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6077D3C06E9
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 23:58:24 +0200 (CEST)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 726A61A00CC9
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 23:58:24 +0200 (CEST)
Received: by mail-pg1-x52a.google.com with SMTP id w8so10533416pgf.5
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 14:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EaFIGGechC7EpN4PWrehUsrca1/pEJnlpXV0nESFhHg=;
 b=og+QZ4BX4cGXa9W4I+mgLzdrSKnVvb398bpPfoYO+kB4IlfiEKkJY6H+OiI/v4oTTE
 dI53/7Ig51GipRSIGV6iChu18skmnmTuufg8hF+PzA6rT/HKmK34UUFh/0gsxj87kQaP
 4S13DrtSgFeUPINUDg0PUSIny+243/RTuHBbTRQpKWNxUeLKdB9MApVsjlJWrr+/cLAQ
 zvi5P2pTRIig7C07PJYvlbgBLA66pRiYhY+C1Yu8vMgiyrMplWJNBX1rPsT4tqzkV4T8
 wxPjvrOxh0FOTafZz7aoJ1O8LbjYAHhQQaJ9cnxwrx93UHP1yZvEwrK5JuzssDmGvdFG
 3Lxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EaFIGGechC7EpN4PWrehUsrca1/pEJnlpXV0nESFhHg=;
 b=lrOEYS3YC2J6NGEU5FxEIaunJ1dwLjIVF/ATAHEzDxx8ceHYwPVWnPLiBjoQiIEiU4
 gUL4WaNVxJ5BIt41MWYs8pRDKysUJq9YSTK/oYrnP/9Brz8KfjteLRJyi/8s7cS+LNv3
 S5cXpoh0OH4GKkI3cnnoEbZmwrf/8Y/STKoW0DshI118O8lgNXR65IWQZCmZuVvXF4ja
 3cnxn7d6BIZr1fUa25sartCNYytJEC1W9cdnwTZIRhKlqzIaO/tTOAjnYeCoORDijGNz
 0ygatCkWM/4kfgJKDmRuNx++BNJJ/5OaXzCVQjJVapsoznPkCBLq2KhrrKG5IO+Enu8G
 qhTQ==
X-Gm-Message-State: AOAM531sq1PuZhqqLgwWXEj/ZmtAZXexI3PX+bEPlmQ3GAfWuJQxD0rt
 cE+d+pAGsLJb6J2EF+Dt7+8D0w==
X-Google-Smtp-Source: ABdhPJzUCNeOwHknlQZM7Ul3EFGTdKlng3cqPx3cUs2SE9y8e580w0uMCcjc3+ZfZBaLVJvy1EZjLg==
X-Received: by 2002:a65:6213:: with SMTP id d19mr20121043pgv.110.1629496702833; 
 Fri, 20 Aug 2021 14:58:22 -0700 (PDT)
Received: from google.com ([2401:fa00:9:211:58f3:22ab:ac76:60f1])
 by smtp.gmail.com with ESMTPSA id k3sm7918945pfc.16.2021.08.20.14.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 14:58:22 -0700 (PDT)
Date: Sat, 21 Aug 2021 07:58:07 +1000
To: krisman@collabora.com
Message-ID: <YSAlb7XGUNoc73ZJ@google.com>
References: <20210802214645.2633028-1-krisman@collabora.com>
 <20210802214645.2633028-4-krisman@collabora.com>
 <CAOQ4uxjMfJM4FM4tWJWgjbK4a2K1hNJdEBRvwQTh9+5su2N0Tw@mail.gmail.com>
 <87fsvphksu.fsf@collabora.com>
 <CAOQ4uxj_WwDPxZv0nr9+Hh+pim6+2onaBdFq_BR-qK=xz+8yUg@mail.gmail.com>
 <YR+CH2+GYzwU2/SG@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YR+CH2+GYzwU2/SG@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/7] syscalls/fanotify20: Validate incoming FID in
 FAN_FS_ERROR
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
From: Matthew Bobrowski via ltp <ltp@lists.linux.it>
Reply-To: Matthew Bobrowski <repnop@google.com>
Cc: Ext4 <linux-ext4@vger.kernel.org>, Khazhismel Kumykov <khazhy@google.com>,
 Jan Kara <jack@suse.com>, kernel@collabora.com,
 Gabriel Krisman Bertazi <krisman@collabora.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hey Gabriel,

On Fri, Aug 20, 2021 at 12:21:19PM +0200, Petr Vorel wrote:
> Hi all,
> 
> > No problem. That's what review is for ;-)
> 
> > BTW, unless anyone is specifically interested I don't think there
> > is a reason to re post the test patches before the submission request.
> > Certainly not for the small fixes that I requested.
> 
> > I do request that you post a link to a branch with the fixed test
> > so that we can experiment with the kernel patches.
> 
> > I've also CC'ed Matthew who may want to help with review of the test
> > and man page that you posted in the cover letter [1].
> 
> @Amir Thanks a lot for your review, agree with all you mentioned.
> 
> @Gabriel Thanks for your contribution. I'd also consider squashing some of the
> commits.

Is the FAN_FS_ERROR feature to be included within the 5.15 release? If so,
I may need to do some shuffling around as these LTP tests collide with the
ones I author for the FAN_REPORT_PIDFD series.

/M

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
