Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A013F4991
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 13:19:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 496D03C9E8D
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 13:19:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 341E63C2090
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 13:19:39 +0200 (CEST)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6C31D600875
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 13:19:39 +0200 (CEST)
Received: by mail-pj1-x1030.google.com with SMTP id
 z24-20020a17090acb1800b0018e87a24300so1559404pjt.0
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 04:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=77kLq4KKo93CAw42c+JCsKr4aBqORkcnO9iq/Z+eQRo=;
 b=O15CIu2095ox08Bm6oiWHovsfdK3GF7CqbVpaKWuxq5GDQu1471nYwRdoOjRIVV70r
 lBfFs4sU4ply7LsCXMK1AlqPRrSwVKPb159/0L6WPF02bPTna8vYxP1eVPlj1Fx3x5vR
 bS68+wMUpR8Y0pDz1jXeh/jM6R2WfS2quTqKS+rpa7Fp3P07IhZ2grwSXGP5NwEA/roq
 lfuApguf7dLjdG2CZw5yk2dzzYut+Sw1Omwqp3vU+CSXfnzfkzZvMiOvKGVjju2xwHur
 MZ7vw/zlyOPJhGei/XtJjlUoLQYjQTSChSrRvTnHP+qVHs/PXPmaj1aKtuaGNyHFi9aF
 mS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=77kLq4KKo93CAw42c+JCsKr4aBqORkcnO9iq/Z+eQRo=;
 b=YT4k7K9NRNRC+4QEPsIEniVyJE4RbVfu+ZzOuObss5diELgySOvE6+nhBOzzm1TVd6
 HsMkWmXhJ4zsoUvsZzdi6zTQuZgpmRwn06//OCc0E0UN0eV5mYmyyCpY2czzox9IIM6Q
 kkfQ3EYRetcsY00HlKdASPW5cD/LdAw3lVhZcsuNVy0MfHyy0GXMK+Kl9IF3gqiTW6Xe
 45Mha2oWRTxA0WOkldsVeVFyQAsgmriDRXuLrCOvz5VAUDb8fwDWA3gcBb1I3gOjHhFw
 eyxWH8lGby2WtJts31WRcuM0MpVzohmACUHW8O32bgNJUWB3xeLetAqfIJK/xOLA4wqy
 aItg==
X-Gm-Message-State: AOAM530sBO3FkWcvKJfpAKaftHTn/8UTPgHw0M6/ADbF6/+fDJmy0cdK
 XN6Dd9vVo7zTeJuHJ/NdhoO5AA==
X-Google-Smtp-Source: ABdhPJybGSkkPY6cs5QDr1fbq+tQqKICUtJkXsCXTcJjvr4jMDcP6UixCa/2S7bNrXvAEslMsCrKrg==
X-Received: by 2002:a17:90b:88e:: with SMTP id
 bj14mr6850588pjb.115.1629717577643; 
 Mon, 23 Aug 2021 04:19:37 -0700 (PDT)
Received: from google.com ([2401:fa00:9:211:473e:ebbc:26b4:6d4d])
 by smtp.gmail.com with ESMTPSA id c133sm15517935pfb.39.2021.08.23.04.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 04:19:37 -0700 (PDT)
Date: Mon, 23 Aug 2021 21:19:22 +1000
To: Jan Kara <jack@suse.cz>
Message-ID: <YSOEOj7xUpADB73f@google.com>
References: <20210802214645.2633028-1-krisman@collabora.com>
 <20210802214645.2633028-4-krisman@collabora.com>
 <CAOQ4uxjMfJM4FM4tWJWgjbK4a2K1hNJdEBRvwQTh9+5su2N0Tw@mail.gmail.com>
 <87fsvphksu.fsf@collabora.com>
 <CAOQ4uxj_WwDPxZv0nr9+Hh+pim6+2onaBdFq_BR-qK=xz+8yUg@mail.gmail.com>
 <YR+CH2+GYzwU2/SG@pevik> <YSAlb7XGUNoc73ZJ@google.com>
 <20210823093524.GB21467@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210823093524.GB21467@quack2.suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
 Jan Kara <jack@suse.com>, kernel@collabora.com, krisman@collabora.com,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Aug 23, 2021 at 11:35:24AM +0200, Jan Kara wrote:
> On Sat 21-08-21 07:58:07, Matthew Bobrowski wrote:
> > On Fri, Aug 20, 2021 at 12:21:19PM +0200, Petr Vorel wrote:
> > > Hi all,
> > > 
> > > > No problem. That's what review is for ;-)
> > > 
> > > > BTW, unless anyone is specifically interested I don't think there
> > > > is a reason to re post the test patches before the submission request.
> > > > Certainly not for the small fixes that I requested.
> > > 
> > > > I do request that you post a link to a branch with the fixed test
> > > > so that we can experiment with the kernel patches.
> > > 
> > > > I've also CC'ed Matthew who may want to help with review of the test
> > > > and man page that you posted in the cover letter [1].
> > > 
> > > @Amir Thanks a lot for your review, agree with all you mentioned.
> > > 
> > > @Gabriel Thanks for your contribution. I'd also consider squashing some of the
> > > commits.
> > 
> > Is the FAN_FS_ERROR feature to be included within the 5.15 release? If so,
> > I may need to do some shuffling around as these LTP tests collide with the
> > ones I author for the FAN_REPORT_PIDFD series.
> 
> No, I don't think FAN_FS_ERROR is quite ready for the coming merge window.
> So you should be fine.

Alrighty, thanks for letting me know Jan.

/M

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
