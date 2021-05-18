Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA01A3874FE
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 11:24:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 75C3A3C87D7
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 11:24:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 253E33C0BCB
 for <ltp@lists.linux.it>; Tue, 18 May 2021 11:24:14 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 944E810000D8
 for <ltp@lists.linux.it>; Tue, 18 May 2021 11:24:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621329852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VENLSMBpGvGJ8hH40cOyvgXxPtVR3HaFpkSA8A5mQm4=;
 b=Etw9FHSF8NyHCa0D2zylcqXhxmBECrLEh3WGaIGC2oEN+vywxWmPrxlIcrThPPTFNgywVr
 11PCuug23zQM6pctKY2qtGHiMX3duJJp9RDwyr/LlitFSCRsRKqn+ej2uRTaf7tDF+1I3u
 0UfaD1SuQTS+URObpeSYFcCeXhEGcbE=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-miMbA4CXPROp3efLmU_SUQ-1; Tue, 18 May 2021 05:24:10 -0400
X-MC-Unique: miMbA4CXPROp3efLmU_SUQ-1
Received: by mail-yb1-f199.google.com with SMTP id
 k186-20020a2524c30000b02905116c9c3759so2989595ybk.4
 for <ltp@lists.linux.it>; Tue, 18 May 2021 02:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VENLSMBpGvGJ8hH40cOyvgXxPtVR3HaFpkSA8A5mQm4=;
 b=Sdq9qS9HPPB+znlHPrPyyDQMdLjVrad4IfLumnZ4DHkVp1GSEEiem9n36LLJ5vFiEG
 Srfnt9WRrpY7E2lPAhvpgiTNQFdXLi+z2T4sYq9VxD6/2gstEGq3t+UTYZUgnqmC+hvN
 +WOXMKttPVyp4q7yjFldFlJmcwEczgJGBs8qylARNiIiHrM7Ulr/4ToFeELyfD8STMx+
 Xu8MmocQfJAFpnM+r6n4I7rkzhS0xJ8xtNqjGviyOir6hRE+AojSm7snNMu2tyQZ/2cQ
 FSRtud3c5m9A39jYMIDKSbEH+5x0VKCfe1I3118musmI7Oc9qpsH0b3Gc0VEN90W48EJ
 5Mig==
X-Gm-Message-State: AOAM532n/0LUSs8vgeX6L9xL5R8C6yQ9D8kuCFeXJ7CdlLvmuv3Fw/pI
 DpkK22EIXIMUo6cqOsbVv3PCL5ouCHqfG7OcZFA+fQGiMaMQl4plhC8LTATn/K2UZkopPxU5oGO
 1dgetRWUIlV1jJVmfJEDRscJvu1Y=
X-Received: by 2002:a25:ae24:: with SMTP id a36mr6265232ybj.97.1621329850300; 
 Tue, 18 May 2021 02:24:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxPvldp/1sps+xJlyT1lJnip3ctmsRCrC4cl/lwO31/9Lvm8Z0q0RlOMewKBj1f2TtfRbXZwsMgywmyDgi2lI=
X-Received: by 2002:a25:ae24:: with SMTP id a36mr6265222ybj.97.1621329850167; 
 Tue, 18 May 2021 02:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210517163029.22974-1-rpalethorpe@suse.com>
 <20210517163029.22974-4-rpalethorpe@suse.com>
In-Reply-To: <20210517163029.22974-4-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 18 May 2021 17:23:58 +0800
Message-ID: <CAEemH2e2wdr01dt9zceWSOOmY25fCLsmLfn=Qg7mYMgi3JumCA@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 3/6] API: Add tst_ to file_* functions
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, May 18, 2021 at 12:31 AM Richard Palethorpe via ltp
<ltp@lists.linux.it> wrote:
>
> Usually LTP library functions are prepended with tst_ if not with
> safe_.

I'm not very sure if FILE_PRINTF should be added with TST_ prefix, but
it seems no harm to do that.

So I just hold a neutral view on this patch:).

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
