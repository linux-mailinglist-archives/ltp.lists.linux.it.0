Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF9491ED7
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Aug 2019 10:27:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F1AB23C1C96
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Aug 2019 10:27:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id B46583C1770
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 10:26:59 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 783216007A5
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 10:27:01 +0200 (CEST)
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 68B052EF175
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 08:26:57 +0000 (UTC)
Received: by mail-vs1-f71.google.com with SMTP id p63so522280vsd.10
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 01:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vCR01+/FGbwbEa80wtnY0CBGdkQPgXOR+kN8EJ/0a5E=;
 b=JEYPSj57E9fI6AnyV7752ATOr3u8YshoymuXOmGYd2RJFaqN42uTY1bIxuXRJr4qF3
 SSZBMIfkNaCv06MZcmlYAb9fpmd3AuOySiOrwh8RvlsPVS4ZB0Tp3ZfedSAgP6g94Eua
 VJWrscSxWSGeKtaZ07x3TYBvzWPQxnxmTlF3z9kLoqoxgZQ3Cef+AKdMbyPKmY9iQo6y
 M1RqBrGhT707pyjeTkK4wajSEW4YJ052esSEbXKSz1u7R5QhAzvPLB76YgrGtjbzAhih
 6jgZ6xTKR0WtXs9kzsOqrpIwXJXLYX6+8wbELfrfCFQZlI7S5P5Y4wKxXlU0TwlLoeC/
 DzCw==
X-Gm-Message-State: APjAAAUKMahFy4o/B13HYzZylJlSV8vX3HQS6hBkZoOHSwWx7raleLc4
 eTXT/RhrlLeznVdhNb4xADrlgJhFHGZOI0SS+ZFyA2mOMrcbotQvEWj8rNof38uQLpsZVZntxiF
 wpjkA4xLgtIZHMPgw8aqsYPmygAE=
X-Received: by 2002:ab0:3384:: with SMTP id y4mr6508599uap.106.1566203216656; 
 Mon, 19 Aug 2019 01:26:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy4ICb7HZ7XQF/t5NNhVjHaEiQ/GfTQJJN0ItvUwg3rYkXGR0oAP4BRacNRVBdG7QcyC3SuGP9Xvq+lf6v5QOM=
X-Received: by 2002:ab0:3384:: with SMTP id y4mr6508590uap.106.1566203216424; 
 Mon, 19 Aug 2019 01:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190819065928.26939-1-yixin.zhang@intel.com>
In-Reply-To: <20190819065928.26939-1-yixin.zhang@intel.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 19 Aug 2019 16:26:44 +0800
Message-ID: <CAEemH2d+PX0VLN5kSnx5G=W7h-uBVZdtEQxNbgsi5P6YwTT83Q@mail.gmail.com>
To: Yixin Zhang <yixin.zhang@intel.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH ltp] testcases/kernel/Makefile: remove 'timer'
 from Android FILTER_OUT_DIRS
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

On Mon, Aug 19, 2019 at 3:10 PM Yixin Zhang <yixin.zhang@intel.com> wrote:
>
> 'timer' folder is removed in 0051eab232e7f777f435945b1aba8911f203d65b.
> Remove it from FILTER_OUT_DIRS for Android

Good catch, pushed.

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
