Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C37209C53
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 11:56:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B45E3C2B8C
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 11:56:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 70D173C1419
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 11:56:15 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 28B666005CE
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 11:55:20 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id q17so2794486pfu.8
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 02:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0Yt39Z9vBRMC2LAzR6QTmz3MzeIS91Uyj4CIekMh8Y8=;
 b=YpJIH+aPnAJZhUbjtms5dYGYhC9D3uEIiiN2B6UyJyPTGg9MO2D9sZJh1VU8fLcE/o
 Fj8bi7RyKuGJA5MlOZl3M9B6xXwuYDiwuULnpwbaab1lPBULWQE9y8IJCVDYeX33BD8C
 2nmXItM35CxmOHNq8TLAA8y9OpNxDm8cfbe8a34Nw91S5N60BsQ9hV9nOha5hU6aQtrF
 QoZ+ZTaZwEhkd1REVwGOGFA3j/qIlLGRXExoD2pwXjmE6wgqU6tGTQzLLO1In2+ltny5
 ulgk9nqTii/UCigLJZB41GGj9/bT0RWYdl9otJCVpQSySzw3yUd8+dQoTFf26dQ3FUJX
 EEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0Yt39Z9vBRMC2LAzR6QTmz3MzeIS91Uyj4CIekMh8Y8=;
 b=TPE12mG2BUyIYY67T3H3WU6ElUYKptVlG3ilukd2qZr7ZPF88nsB21P5Lw5AGINuxv
 Wla84thOmHcimuJUeuYuNsTMft8X6RVuRCUHZXOo1rLXlNUHTqk8enl+s7oqSACfVVkX
 WUlEP8RW3cCL/aDeDK8RJa830MtOZooZgBkhj7GRQ0Qr+1KAnjdjmYZIFylvws/NhIMU
 OHQFw2kedC3S0cpq9TXd/eZ54XXwQMGbpfa5tXWfNdP9Hy7qbh4d6KvrgqvL1lGfeX1n
 0A68R17jdWWCiwTR1V4bnajht6BX2x0qGtUe0GuZaMo3DQs5Lh79lzDvk9KZ01koPWk6
 mVLg==
X-Gm-Message-State: AOAM532xT2jcFvY4FlWpIFo/Qek16/mWVcBCt4e0MAun4vHILj+F/LJP
 8Y9RAcc/HDhZNM9QBIWeUyt9WA==
X-Google-Smtp-Source: ABdhPJwN67qPRSQ9I9OnHIgKuJJsHtVnPA7U/uiX2zErdtF2+oTEA6WSFQAMqAmn5Yy6cMUzUrjXMw==
X-Received: by 2002:aa7:9488:: with SMTP id z8mr34864684pfk.157.1593078973101; 
 Thu, 25 Jun 2020 02:56:13 -0700 (PDT)
Received: from localhost ([122.172.111.76])
 by smtp.gmail.com with ESMTPSA id r4sm18813823pgp.60.2020.06.25.02.56.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jun 2020 02:56:12 -0700 (PDT)
Date: Thu, 25 Jun 2020 15:26:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200625095610.6g5p3tsfsmfl6zrh@vireshk-i7>
References: <cover.1590144577.git.viresh.kumar@linaro.org>
 <db9669587a1c19b056a1cca6908fb8b5f316a76d.1590144577.git.viresh.kumar@linaro.org>
 <20200624143056.GB5181@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624143056.GB5181@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 02/17] syscalls/timer_settime: Add support for
 time64 tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 24-06-20, 16:30, Cyril Hrubis wrote:
> Hi!
> So this test depends on the previous one since we are adding the tst_its
> piece by piece, shouldn't we add all the functions into the tst_timer.h
> in a separate patch?

You mean functions related only to "its" ? Or all the wrappers for
various syscalls that are getting added to tst_timer.h ?

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
