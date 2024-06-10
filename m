Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 06878901B80
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2024 09:02:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1718002946; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=IOSxz8Y7IbeHML69jZ62rQa1BP3kNtVO0JDLZjNqI2g=;
 b=BR6dJbBWp31XtvFWzcQc8K+kMsPd9LAe0VPQyq3ws2W5rPMs+EPxVyfGiprQVGbXL/+xO
 J0Wi9TNCGHZyQep7YAfqJVfJD1vPNexZ/Gb8bcZPJjTsQskDVmlvZhjlOVZ3UEsh6NWl1ga
 2f6eSBM32fMsXUegIRi9kt8H12sCHgg=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B064F3D0B0E
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2024 09:02:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D7A243CD847
 for <ltp@lists.linux.it>; Mon, 10 Jun 2024 09:02:24 +0200 (CEST)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 28FEB600058
 for <ltp@lists.linux.it>; Mon, 10 Jun 2024 09:02:24 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-57864327f6eso5843121a12.1
 for <ltp@lists.linux.it>; Mon, 10 Jun 2024 00:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1718002943; x=1718607743; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I6cnlZ1aUujrMEryx0TlFgJFPSCbkKmMl6/W/W7/sMg=;
 b=FMwwJ0g6oXdAMMofy8UucO0u9HiWtBCvP3zeW9vFkYwxLGXcl/U72m+/3Ir7e48jL5
 7U6iPikgj3oLt/KpI53D1CaCx9C13i3f1hqeFbbtFqXDO0xOg2AA+J/w8V9NPUnjpdYV
 PEhNysHMoEIkxbkmFUPPZolSx2jj0I2w/CVm5mr1eYrw2nb5tYwXupJlHCON7jLMZGEF
 aOI7lxReB1ts39PF2IzPHXbkLMldHAS1Jhx8KrSlSVdMRWsFrxIUo9AuwXt8YAxUqTOV
 90KkJ0wOlKiRBDd4yhOIMWnjUCNxhunqw+4yM4YrgOOD/KjaoJAo/dGSS2F29kOZgYAP
 Nsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718002943; x=1718607743;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I6cnlZ1aUujrMEryx0TlFgJFPSCbkKmMl6/W/W7/sMg=;
 b=Sbx/sYtnz1xRtX3YfuvjgrbAugW0vI5PdENe59N5hvgzrSEBHm/eBPqKUgeFvpYt7A
 fnJaKQ9M2B29lk+s1i49f7WGiIxh/ydnIuprhq20q2BPjqy8AEgxG/2FdSpiONwTXz5n
 K9VNurEExhxWs2yBO7AHA1T/cXdxHucnnPm4tzG4VyZt/SQW7FFLUmr9j+3WlAYzcZ7u
 3zxkemZqhzTQw4BSLHMd6Vc0Q7e7EfoN/aziLYLgPuH6BQMSugypZP3WY9PBueP22t68
 uj3v3ONji5QA0MZtO7z8/lBoekjfWi+GhXKO8pKR/hrBi4cgKXgVpwMh0tjutbx1v8vk
 zAlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCVyr29kq46+a/goYLaZDoHGFSQIRzjWDjuYT4mRg/Ott8ByayZHnvBKcnQSiEAZtJr+QGyfMcst2ikyPmXTjAdVQ=
X-Gm-Message-State: AOJu0YxuVikclSCn0NKlF2WOngZGEwXRpVnRktyszcJFgcHEq0vMYE1H
 71K205Z8o8b4jCf1IPUJww8KK/Md6zRFy04o9RcZSrwKbv89+eqvc+aHEyuk92o=
X-Google-Smtp-Source: AGHT+IFcQBf8uvIt46ZILkWK0U4if+bgTdlP1CmhLsGC06SYGllqDk9mkW9Ol3hAy3fVyn1dVkMfag==
X-Received: by 2002:a50:998e:0:b0:57c:6004:4388 with SMTP id
 4fb4d7f45d1cf-57c60044692mr5353563a12.6.1718002943173; 
 Mon, 10 Jun 2024 00:02:23 -0700 (PDT)
Received: from [192.168.178.40] ([212.86.42.167])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c80997d90sm1623549a12.25.2024.06.10.00.02.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 00:02:22 -0700 (PDT)
Message-ID: <ad43b512-ddf9-4826-97b8-d3652a51c8cc@suse.com>
Date: Mon, 10 Jun 2024 09:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20240607141131.111470-1-pvorel@suse.cz>
Content-Language: en-US
In-Reply-To: <20240607141131.111470-1-pvorel@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 0/2] doc: Add hyperlinks
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!

This was (indeed) a required job.

Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>

On 6/7/24 16:11, Petr Vorel wrote:
> *** BLURB HERE ***
>
> Petr Vorel (2):
>    doc: Link API pages, rename title
>    doc: Remove part of old GitHub doc
>
>   doc/conf.py                                   |    1 +
>   doc/developers/api_c_tests.rst                |    4 +-
>   doc/developers/api_shell_tests.rst            |    4 +-
>   doc/developers/ltp_library.rst                |    5 +-
>   doc/maintainers/patch_review.rst              |   10 +-
>   doc/old/Build-System.asciidoc                 |  218 ----
>   doc/old/C-Test-Case-Tutorial.asciidoc         | 1079 -----------------
>   doc/old/Contact-Info.asciidoc                 |   28 -
>   ...TP-Library-API-Writing-Guidelines.asciidoc |   84 --
>   doc/old/LTP-Release-Procedure.asciidoc        |  171 ---
>   ...Maintainer-Patch-Review-Checklist.asciidoc |  139 ---
>   ...-kernel,-libc,-toolchain-versions.asciidoc |   77 --
>   doc/old/Test-Writing-Guidelines.asciidoc      |  430 -------
>   doc/old/User-Guidelines.asciidoc              |   73 --
>   doc/old/rules.tsv                             |    6 -
>   15 files changed, 13 insertions(+), 2316 deletions(-)
>   delete mode 100644 doc/old/Build-System.asciidoc
>   delete mode 100644 doc/old/C-Test-Case-Tutorial.asciidoc
>   delete mode 100644 doc/old/Contact-Info.asciidoc
>   delete mode 100644 doc/old/LTP-Library-API-Writing-Guidelines.asciidoc
>   delete mode 100644 doc/old/LTP-Release-Procedure.asciidoc
>   delete mode 100644 doc/old/Maintainer-Patch-Review-Checklist.asciidoc
>   delete mode 100644 doc/old/Supported-kernel,-libc,-toolchain-versions.asciidoc
>   delete mode 100644 doc/old/Test-Writing-Guidelines.asciidoc
>   delete mode 100644 doc/old/User-Guidelines.asciidoc
>   delete mode 100644 doc/old/rules.tsv
>
Andrea


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
