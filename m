Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B12BC39B5A2
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 11:13:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D0AD3C4F2A
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 11:13:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A95133C248C
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 11:13:19 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BCF4720100D
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 11:13:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622797997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RHkAptgG6I4xzIGUxKGyRpjrB9Iq6ccN/luhGgp2FNg=;
 b=b2PLfuSG0nigi/0e7DTI3l5sqaaMAwnmmT7oebICe2WZVhjgrXcSymkR1VGGyGajg6xe5h
 eYC1v6BWFCedPvbVpJdbnS6eUft8h0O9s/KweXpdnYAC3p/ry8JuqA2QGm+S3dtbkACaog
 KejNG+SnLcFVAugNx5gtLLJA6NsuCI0=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-u2F0dpyKPyCMntkf-21ZSg-1; Fri, 04 Jun 2021 05:13:13 -0400
X-MC-Unique: u2F0dpyKPyCMntkf-21ZSg-1
Received: by mail-yb1-f199.google.com with SMTP id
 n129-20020a2527870000b02904ed02e1aab5so10762187ybn.21
 for <ltp@lists.linux.it>; Fri, 04 Jun 2021 02:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RHkAptgG6I4xzIGUxKGyRpjrB9Iq6ccN/luhGgp2FNg=;
 b=m7Ugj569Iz/3F2sBjzpgK+hOVrWIh66G4UIeDyVOnglTRCfD2vtP4748u3T9CTfvEI
 Smq00Ns8OalP9m7eXrMloDG8Fi6OZUISyOqBbzH/wYSn22HzHc32iIa4nPaLK6PeuF8x
 MpBI91r91vukxS5K+cL3kyFcZGYNQaH6cid5gCWUaWmicZNhcVwhkrQxCqD7JzHYaBCL
 RySE84d/aKiLAYSDzOiqLOka7SnjOuAcRcharaZODKc3fOfNuYKPzBzUqfN2lSBi+fcN
 DnSWi7kChqx1U9DcGOlOl0rovYB6CkRAhNjtavKQ2vcCIJnBnRDezuqqP0AE8v89PW6+
 vvdA==
X-Gm-Message-State: AOAM530ydoKBxwfwOZoDyrOvVV7X8kMhwhRn+iHtMGLOtaRahUiYRTj4
 ivdS402Ts0CAOffbLyzniNXHNh55B9YCQrS4F69l5G+mOAStB4+gK5AIOwGcqjvgumCp2o+dZaq
 ghfLOLGmPSopPZqGtwxfGGs9AdHA=
X-Received: by 2002:a25:9d86:: with SMTP id v6mr3921439ybp.366.1622797993020; 
 Fri, 04 Jun 2021 02:13:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAxwO3xOiH+hILHmvd+pfd/hPzBj10TYHQK7OKYg6CoCMr+N8A1JQGpR2MykSEEPC1S1NU5+FPXaBEPvLPe7o=
X-Received: by 2002:a25:9d86:: with SMTP id v6mr3921411ybp.366.1622797992811; 
 Fri, 04 Jun 2021 02:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <YLeA8KOphpVg3IDP@pevik> <YLi3XqA3hLh7HWqn@yuki>
 <YLjDnXeWib2KSILF@pevik>
In-Reply-To: <YLjDnXeWib2KSILF@pevik>
From: Li Wang <liwang@redhat.com>
Date: Fri, 4 Jun 2021 17:13:01 +0800
Message-ID: <CAEemH2dTBbHbh5Vf9EQyYMsvHKs3p4sZvoNyR=uCFM0X5siYtQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Reduce LICENCE/COPYING files
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
Cc: Mike Frysinger <vapier@gentoo.org>, LTP List <ltp@lists.linux.it>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> > > I suppose it's safe to keep only single licence in testcases/open_posix_testsuite/,
> > > but could we keep only COPYING in the root directory and delete the rest?
> > > Or keep COPYING and testcases/open_posix_testsuite/COPYING only?
>
> > Do we even need these files? Isn't SPDX identifier enough these days?
> It be nice we don't need it, but not sure. Looking into kernel tree, there is
> LICENSES folder [1] and they describe how they use SPDX [2]:

My perspective is to stay on the safe side, keep one in the LTP root
dir and one in the subproject(e.g. open_posix).

The general files go with the SPDX identifier header.

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
