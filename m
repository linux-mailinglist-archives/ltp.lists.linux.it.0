Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF8A1B1FF6
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 09:37:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B43B53C29A1
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 09:37:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id CCC613C2990
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 09:37:26 +0200 (CEST)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3028A1A01443
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 09:37:26 +0200 (CEST)
Received: by mail-il1-x12f.google.com with SMTP id s10so11754748iln.11
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 00:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=6ZNjekXTPTT2e7hJABpFf0YDr9ZUfGOcWVLnhaVcvRY=;
 b=mt+FotIKsZtQjbCFv8nwjXFbom+PgijBDkKhx7rlTzUcjNre1UXAAhVuHOUWr5VUaM
 vCIREvLEPfAiYX5EDz50nqWjWA6kJXIDxId/6LlPgTVYLwNqz61sxIjpD5ADdw5tpB9k
 O4XHE83Whc3kuES2mc+uI6EPtWyCwjFrHZ1JGW31baHxkR67OPxkNvP5mdOYS+onEm+F
 /+2m0yWDqUE8m3/nTGJCrHVTU/2CebQEua8iKgTmYNuBIkVj/dk1qGzMi5/UJMCvrJ7X
 3ICw0BqfW3xy/aOZ87kDOqRrSWaEcsUXpSWHfdKjuffkINg3PK7IZxHE3qf4sq1r69iM
 Xyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=6ZNjekXTPTT2e7hJABpFf0YDr9ZUfGOcWVLnhaVcvRY=;
 b=jJUsRZbHRk7lR2oUvKvJAvZoOH4esL4asvtFzrIBdpr/33xD7V1jTusaYqEWMNrYpW
 Ik4EzHvyLKjelOAMKwyVkLDIWPo4kcRvsJxzqb0EdT+H5ZWybl4LRyBm+YX4WKJvrjv7
 1buLJCvQu1/Fg0P/Zjf9twzQdqBoZ6qukIERX6wbE9k/dGynyVw4+YQ446SPukiZQE4l
 EfShlWg1VC7NMyp1RBUS753EiviIwx9XGRRE7LIrHzwv/ziQP6MTaEuBbCpOA9poVAQ1
 P0poVf2hxUFXGekGPioPMF5FdyFfi3HPavV5G6EN8rgr3KcwoTAiYeR7AMw5vBAS8oWn
 C1hQ==
X-Gm-Message-State: AGi0PubJfZYuPLGw3EP1UAGRpnwZSpV/pU9/XIBPChZ3eNDw2Q07r52q
 hgr78Bc57tmwwAPqTL0qhbVxL0ZXf/f++yLQvuZvqw==
X-Google-Smtp-Source: APiQypKPj6cMlihVrpcLCZUOYRyKpTOD7zNOKmKqG/H3og+GzZi/Gxt/EbA2u2n1xNgn5MBQ8AoyMcyg/MQCRoQtuDE=
X-Received: by 2002:a05:6e02:48b:: with SMTP id
 b11mr19617928ils.304.1587454644760; 
 Tue, 21 Apr 2020 00:37:24 -0700 (PDT)
MIME-Version: 1.0
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Tue, 21 Apr 2020 13:07:13 +0530
Message-ID: <CAKohponWBU_pSDk6sjsMFBkJzwPDz71DcyC1_X6x1=0bZMb=aQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] Purpose of clock_nanosleep2 tests ?
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

Hi Cyril,

While working on the time64 variants I stumbled upon
testcases/kernel/syscalls/clock_nanosleep2/.

The commit  log says that we were trying to test clock_nanosleep2()
syscall, which I am unable to find, but still this ends up calling the kernel
variant directly for clock_nanosleep() only.

What am I missing ? Why is this stuff required ?

--
Viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
