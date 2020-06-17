Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F03871FC543
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 06:30:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E31223C2CE5
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 06:30:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 291673C2BE7
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 06:30:51 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 558B3602134
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 06:30:44 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id b201so521748pfb.0
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 21:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PZvbuarKze492HjSq+dK1p/DjLBTZ2Imn7a05EcHOvQ=;
 b=FuxaddMCAZXpPC0ui/O5S2cJq5r3YHEC7VmRAfp8OGowGwgGRz94biMVlm71Xqhf/+
 HfTK3zNFg8X0J408J4x6EH2qltzyUkE5sodyja+343X7VsSEfLNp6lbVTYzRF5NKpI8o
 84XMeLdORU9yewARUMGRTPGaznnTpT4CFCJWuQdDzeoOSH0NBy0HlHmy6n8HeBK/9TDl
 xeooTE/jw6LzbXGEVPpaP/KVXpFZYNx6jRvWjizIdGtft9Bd8ltSaa88BxjpU4qqsEAr
 9fQQX1Yt6IoXg1f1FsvvRBUYyr1PPzsRSkWNVuSDjNCHwFK1wkT9JmvCh835z2MGhRmy
 +jVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PZvbuarKze492HjSq+dK1p/DjLBTZ2Imn7a05EcHOvQ=;
 b=tphgqYCxLxhBBXMEctQjw4mjgdnITDZDH8qCED9pLkpb5SfNa9iZGnuPWUqk3f/E7L
 j5aZXnal03BFDBaEvHAnCK1xs1uz2V43lchhF74quvyyg1YAqcxN8rZcL8N6TfB1RdK7
 QzexLSD9Dm/VZ8NIMFFCPSHkFKPOsjB7RbselteXbllOo6NOK18ju2vNYu1G95MZcxjS
 ehO3Tdh+TPgXV3y8oiqD+FeByrS1hzybAVXwcGaBkAmW6L2R4iqkoOHqVyTsc1XesydP
 q7TXzR4OE/okf6ljQAKfx2kdo9H50TqqO3soeMHJ/bvDq5kgz2ra4dki7FZ5iwqnNQY6
 2Z+A==
X-Gm-Message-State: AOAM533WVzhZAwQgQcEj2fdlYn9qipUBaNCsJzDWWimV6bepU4yZwkpd
 xxVlsVUbOf6fFK4/8hcVtlL4Pg==
X-Google-Smtp-Source: ABdhPJywuk2ZeBuRwaNgEKhu+RFGeKGK4hfdkNKD0I27QXZ6LhuxS7vUizFSD0zw29BIrwhGrqfaEA==
X-Received: by 2002:a62:8402:: with SMTP id k2mr5033969pfd.301.1592368242642; 
 Tue, 16 Jun 2020 21:30:42 -0700 (PDT)
Received: from localhost ([122.172.119.132])
 by smtp.gmail.com with ESMTPSA id z1sm18503449pfr.88.2020.06.16.21.30.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jun 2020 21:30:41 -0700 (PDT)
Date: Wed, 17 Jun 2020 10:00:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200617043039.x25qtumipozkhjma@vireshk-i7>
References: <cover.1592302358.git.viresh.kumar@linaro.org>
 <7616a6fa4f1502dde4417d33aa88836c8020419e.1592302358.git.viresh.kumar@linaro.org>
 <20200616161150.GA20634@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616161150.GA20634@dell5510>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 5/6] include: Add declaration of struct
 msqid64_ds
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
Cc: arnd@arndb.de, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 16-06-20, 18:11, Petr Vorel wrote:
> Hi Viresh,
> 
> > +++ b/configure.ac
> > @@ -153,6 +153,7 @@ AC_CHECK_TYPES([struct iovec],,,[#include <sys/uio.h>])
> >  AC_CHECK_TYPES([struct ipc64_perm],,,[#include <sys/ipcbuf.h>])
> >  AC_CHECK_TYPES([struct semid64_ds],,,[#include <sys/sem.h>])
> >  AC_CHECK_TYPES([struct shmid64_ds],,,[#include <sys/shmbuf.h>])
> > +AC_CHECK_TYPES([struct msqid64_ds],,,[#include <sys/msgbuf.h>])
> 
> NOTE (for next time): we try to keep items in configure.ac alphabetically sorted :).

I normally keep such things sorted, looks like I need to watch some
"ABCD" youtube videos with my 3 yrs old daughter now :)

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
