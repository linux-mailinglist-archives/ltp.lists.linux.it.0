Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 557CD1D06FA
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 08:13:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA1E93C2236
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 08:13:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id E9E7F3C176C
 for <ltp@lists.linux.it>; Wed, 13 May 2020 08:13:49 +0200 (CEST)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 155A91000A83
 for <ltp@lists.linux.it>; Wed, 13 May 2020 08:13:49 +0200 (CEST)
Received: by mail-pj1-x1041.google.com with SMTP id a5so10641659pjh.2
 for <ltp@lists.linux.it>; Tue, 12 May 2020 23:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=i29pfZ4o0J+xY0nUmn9IMR6biVzdmzFMXbOBrhWv2Jg=;
 b=O73hyoqOTLoAW5o8+FoZPdTWfkC9Em4q/ONFH5yUO/mTF3R6Q2TABS5R4NJFPTZbsx
 sPwT3S0pUcDCf3sga1KQXC/HR4fdVaAj89mzdhClyQM5qck/GTZm3bGELbXVtosqXaCV
 wSTlWRtLK+0fuSQMaCfMvKt1/drIaqkwnONohCfSkHtn3gcjLbHi9dQGjRoP6pQjxf+I
 ZBU5iwWdDLhZ0fDaIZubghXLyx4eFJ43JBR5k2FzEriWLgxDzLkLCNq89Gp/gGxviJzw
 1ImU7uqDz3ClO7xW6EjYY1snQXFV+fDyncBrUm2BZfys7TxDsptDplUYAbfZCpi6GanQ
 +wPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i29pfZ4o0J+xY0nUmn9IMR6biVzdmzFMXbOBrhWv2Jg=;
 b=T4DvYuBUtWif/AXtY9F6WSSTvUxETH3nLm0CVBIxZxCrx6IhNE9jZ+d+0IWGSCMaLy
 O0ax4buQovH7pO2IUtBD7jH4VOyFhRWOb6div0WhX0O36DqAjWajlcL37g0yqp8FsOvo
 jRkqul892U5L4Vwylb/BzFGVK43RNrsQHQV8oPbrQS7cKjzy6M+MV5U6PnsvGFkK0NyJ
 CNMyl1Iba+zVnLDbKAt282YmNzva6Ya+ZXZF9J33ymwyBCOcgFFoW1VSMH53sYbb7Otr
 mr/mJchOate0LuLlEhL8groF0ewFYB+5XQvgwR+nDtBuLl1vLh2MNF5mTYRlKvJ7WRrX
 33PA==
X-Gm-Message-State: AGi0PuZZ4R/9FHH58Aa3Xyl8QRy0VYpW+v6+Gk10u6JSKpry3de4/A8v
 9AGhf1dAsIbA/hZCueKwFyD7Fg==
X-Google-Smtp-Source: APiQypJ3tJ+InJrKyYYn9nN1Rywbjbn0vTdsswt2dO1OXkHkA1RSpFX6/WbDfR7izlhrqqBrbnXDYA==
X-Received: by 2002:a17:902:7:: with SMTP id 7mr23675086pla.157.1589350427452; 
 Tue, 12 May 2020 23:13:47 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id 14sm14607898pjd.36.2020.05.12.23.13.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 May 2020 23:13:46 -0700 (PDT)
Date: Wed, 13 May 2020 11:43:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20200513061343.mjhmciatmx4sw2ub@vireshk-i7>
References: <20200513012626.1571-1-yangx.jy@cn.fujitsu.com>
 <20200513012626.1571-2-yangx.jy@cn.fujitsu.com>
 <20200513055533.ipmghf2oacc22mzy@vireshk-i7>
 <5EBB8DAA.5080509@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5EBB8DAA.5080509@cn.fujitsu.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] syscalls/pidfd_open*.c: Drop .min_kver flag
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 13-05-20, 14:03, Xiao Yang wrote:
> Could you tell which issue happen? Thanks a lot.
> The other two don't need the extra check because the implementation of
> pidfd_open() can do it well.  For 3rd test, I want to check the support of
> pidfs_open() before doing fork().

What I meant was that the solution needs to be consistent across
tests. For example, with the current change the run() function will
run for all tests in pidfd_open02.c and print the message that syscall
isn't supported, while it would be better to run it only once in setup
and get done with it. i.e. 1 message instead of 3 similar ones.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
