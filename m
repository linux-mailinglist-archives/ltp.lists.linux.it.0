Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E88C42969A1
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 08:19:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A39593C3170
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 08:19:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8A74B3C2214
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 08:18:58 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 09CA91A01065
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 08:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603433936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yRHqN5PSqAi5ctq+t0Co9d0gSQ/xCFH7XG0zPVI9bXE=;
 b=DveaY4y6wjlkB7Yd8z1bID0NEysB/lPaRBVwPLSiCMzwlKS5c9MLqJN8qBrzas9962JD3q
 s6X7LFWhG2QDLWr9s+z3dyyJF1/APOP9NwS0QTr3irfOEq+vhsIndQVOO6rPVYn4jhqzth
 r/MNhmSKwZgqPWBsnwLkg9JRlhwf3yY=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-7SQQ4eurMFWcS3eY4I8imw-1; Fri, 23 Oct 2020 02:18:54 -0400
X-MC-Unique: 7SQQ4eurMFWcS3eY4I8imw-1
Received: by mail-yb1-f199.google.com with SMTP id h64so755579ybc.1
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 23:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yRHqN5PSqAi5ctq+t0Co9d0gSQ/xCFH7XG0zPVI9bXE=;
 b=JE2bHY2SNLlIsKJkHXfPG4khVRurVsvgXBBpjOXQ5rVjxwhKJU6LlMUbHI3pOoVrsG
 7btVivTa5oncYckTFwc5xVlvSqJlN8lg8W472eU/XB/c/VLaE65Jy7g1c476lnfi6wVv
 o433FqHCWYlIKCq/SOTogFyh/h83yetIMeqL8+4ZUavYre9V4mZwYKERRIU71dB/bzHT
 kh+ns3LccfryVQ4yMjYGaxaqyl8Fya3rk+dd4hcndm3PJv5BTYCqIDwg1v64WQKH1Pvt
 ktJYsswulxusllvD7KrjfXmF1ChtFqeU9IxgI1ngc0oUI01FYxPXrXc18+R7gqG1phIC
 p0vA==
X-Gm-Message-State: AOAM53108sOnX2b/2a3TL3DkjAKr914FhLTCMdQuvYQkmeXR6ogjmX39
 RPAjVQ+1sbBhSkNLeQCPZpw6Jrc+xcw/8zX5AQF5QKJnsfBMedvPnDvy+OblCckUC1LdpsJOZGq
 MwaLNtsQyRCkL4Ea7Vh9K9ObiHag=
X-Received: by 2002:a5b:703:: with SMTP id g3mr1350516ybq.86.1603433934164;
 Thu, 22 Oct 2020 23:18:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTHwiE0ETMUXToR7I70JUMRAxM90gJR0Vf3lXR4YYyOKm5KwP5zZEIjkTR2qczPsirmqVK6WdZV6JqpoRPaM0=
X-Received: by 2002:a5b:703:: with SMTP id g3mr1350503ybq.86.1603433933932;
 Thu, 22 Oct 2020 23:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201005133054.23587-1-chrubis@suse.cz>
 <20201005133054.23587-12-chrubis@suse.cz>
In-Reply-To: <20201005133054.23587-12-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 23 Oct 2020 14:18:42 +0800
Message-ID: <CAEemH2cE64fq2Qn1AEuLQN5aBWv7MRykEpc5Bw=_4H5N1ZJYkw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 11/11] docparse: Generate html and pdf using
 asciidoc{, tor}
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

Cyril Hrubis <chrubis@suse.cz> wrote:

> --- a/docparse/Makefile
> +++ b/docparse/Makefile
> @@ -1,19 +1,77 @@
>  # SPDX-License-Identifier: GPL-2.0-or-later
>  # Copyright (c) 2019 Cyril Hrubis <chrubis@suse.cz>
> +# Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
>
>  top_srcdir             ?= ..
>
>  include $(top_srcdir)/include/mk/env_pre.mk
>  include $(top_srcdir)/include/mk/functions.mk
>
> +ifeq ($(METADATA_GENERATOR),asciidoctor)
> +METADATA_GENERATOR_CMD := asciidoctor
> +METADATA_GENERATOR_PARAMS := -d book metadata.txt
> +METADATA_GENERATOR_PARAMS_HTML := -b xhtml
> +METADATA_GENERATOR_PARAMS_PDF := -b pdf -r asciidoctor-pdf
> +else ifeq ($(METADATA_GENERATOR),asciidoc)
> +METADATA_GENERATOR_CMD := a2x
> +METADATA_GENERATOR_PARAMS := --xsltproc-opts "--stringparam toc.section.depth 1" -d book -L  --resource="$(PWD)" metadata.txt
> +METADATA_GENERATOR_PARAMS_HTML := -f xhtml
> +METADATA_GENERATOR_PARAMS_PDF := -f pdf
> +METADATA_GENERATOR_PARAMS_HTML_CHUNKED := -f chunked
> +else ifeq ($(METADATA_GENERATOR),)
> +$(error 'METADATA_GENERATOR' not not configured, run ./configure in the root directory)
> +else
> +$(error '$(METADATA_GENERATOR)' not supported, only asciidoctor and asciidoc are supported)
> +endif
> +
> +ifdef VERBOSE
> +METADATA_GENERATOR_PARAMS += -v
> +endif
> +
> +CLEAN_TARGETS          := *.txt

I guess the generated  *.css *.js files should be deleted as well.

--
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
