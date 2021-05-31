Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BF139580D
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 11:25:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E7213C8051
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 11:25:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 25BD43C2907
 for <ltp@lists.linux.it>; Mon, 31 May 2021 11:25:36 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C1856200B39
 for <ltp@lists.linux.it>; Mon, 31 May 2021 11:25:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622453133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jXmQlJD5njhyg9lOELJRxwD2qcyCMbdbK5VSPQkq+1M=;
 b=DPeHfwDix/Uqum2pBceEqfd1aZ+BbgFIlLFX05a2EB+XGTTKn5IzY6xvowndwq3riISD0K
 6S3yntOomsyByf6jEclMZe0fUMAEuXNr7+4+xwSCQuUwrUQh7OsZGR0RAgMC5+u++2eLxA
 AJh0SSzmH2uV56Bm4UJbMY7iGafRBEI=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-mjQL0bk5PR6TNpi_Z0ITkA-1; Mon, 31 May 2021 05:25:29 -0400
X-MC-Unique: mjQL0bk5PR6TNpi_Z0ITkA-1
Received: by mail-yb1-f197.google.com with SMTP id
 a7-20020a5b00070000b02904ed415d9d84so13040190ybp.0
 for <ltp@lists.linux.it>; Mon, 31 May 2021 02:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jXmQlJD5njhyg9lOELJRxwD2qcyCMbdbK5VSPQkq+1M=;
 b=SD7tDqoDgG+uP364/EFjaadYBYziNksXrsUvQN+ndoXSfFKelF620+jmEPXI+69hCA
 /Y6SEuYDzwQKPBFvbbGL0lbTtswb6RGkvXi6KBG5P75fepCLMM7euMhr8wyrHUyFpHdi
 EjmyrYrC9WDE0QpUve2wTwRnUt9gwcDYb61Pc5KjBVxhKBztPDcv1gxGyTjauNcLONBf
 G2R4t1Bix7qYCTyKCrhWwG4LgHsOKb2UmlWosd70CPQIAGrundcj7LoN99NkagIAaMhO
 5n3AV3sBJA7KpuU1fezproetNYaiRam9kbtMToGn7mplSV2Jl2rLj8ioLLB8suzg22MK
 gwHw==
X-Gm-Message-State: AOAM531sQks587PCVycnzvCDJWTvRsdoI8fRqCjnyaeESdbP8o7bqyEv
 ZCElFYAMQPeqV3rVh9kPVO5hsodD62GnCSiQ/f0dhoxcOdH9sebWveWAt20gqBlYx/WW5/LecPg
 4Sm44zMa+VBgpr6LGOpu8k22zjRU=
X-Received: by 2002:a25:1455:: with SMTP id 82mr30659699ybu.403.1622453128723; 
 Mon, 31 May 2021 02:25:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySh28CcM6DBW6sIsCAiQBkaGF0plaMD+qQwoXqjNaK9/Lj92cm5v6xkg6qDSwmvrntC4ugcQhXLruJdqdM6Hk=
X-Received: by 2002:a25:1455:: with SMTP id 82mr30659677ybu.403.1622453128440; 
 Mon, 31 May 2021 02:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210519085812.27263-1-liwang@redhat.com>
In-Reply-To: <20210519085812.27263-1-liwang@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 31 May 2021 17:25:15 +0800
Message-ID: <CAEemH2e5Kt5T3zLN9VcgQPXB4pR76+twe3sOBzK3AW+seCZvMQ@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>, Cyril Hrubis <chrubis@suse.cz>,
 Petr Vorel <pvorel@suse.cz>
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
Subject: Re: [LTP] [PATCH v2] tst_test: using SIGTERM to terminate process
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril, Petr,

Any thoughts on merging this one?

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
