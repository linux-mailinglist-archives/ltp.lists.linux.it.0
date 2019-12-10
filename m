Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 186C71191A8
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 21:14:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9DCC13C2281
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 21:14:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E79FE3C2209
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 21:14:52 +0100 (CET)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 78D84600BA2
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 21:14:52 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id z3so21592605wru.3
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 12:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=o/yUd7cOrleqZLwY8xNQqtQIaBj51Usk9+TgVGck2Z8=;
 b=d+QuujsfJJh9NUrwPOX9YObJ/53yHPZPF0urHt5bfNOOAanfsQ+9+jFSi8PFSswUhJ
 cK8HzuwGXQ5IA7NGCgJyCSyceTmRMOrLGWmSYaY4eeXIgupdcNCR15cPRVURt4kbOBrS
 gIkRnCHAHMsxoveml6uBmsIZQcLZGWR8g4HTpybJ8D7cS/C1xVqAUeXX2DlhoHjdrk1r
 5CN8V+ncLPTJp6UlpBesXBMzL6gl5fTiIFFMtYhZ1jDpcpTZEPUN56IZ4nSbL4yWmTGO
 QoXzJ2wdNind7VZkDGiRba+hnToNjaLIgQZuZkDt2vWnbTpWzdeR8EJ7AD21eYsI7IM/
 SLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=o/yUd7cOrleqZLwY8xNQqtQIaBj51Usk9+TgVGck2Z8=;
 b=d1YByucFCjCG3RGVvJtkn5hIQXY3Y9SEvtI1jqQyarB0/M1GTwcT15OJPbQAoq0IG7
 EKRglmE73rFRyTxT0DgW4jNp13WXXfd62BTSGKWuo34X1R0DMFFOBMck3i5CpG/Ib71b
 2FQ1dmpo/XiN/YKUa59OFIcF6c2FhsE5pFgNNSLHN0G+qBsowLCjnEoZXj4cqaq9dLVd
 scle5mTw/IhvcB0WXCnBKyI9602J1BEH0wrBqL4T3syJZkbJPRZy8hzPCDZX22KUZsP/
 s5MW++ErX+R8IFEoN1MnEJN6C1S0AmYZ3/Ijp1vtcO5G0uqa/95mbAQCkRyKGP3Tm7cj
 yvtw==
X-Gm-Message-State: APjAAAVOlfRZqUAxsn8NUplmKZtWRHUs3OWCmMt7Y6SJH+GGd+xc3PIe
 ui3OigiqAfPLekSo5RFKzDKnrYqL
X-Google-Smtp-Source: APXvYqwWqUH5ZeIWfNVhqpwkIIH2upOTsZykPROdS0URslSrPPUxWq/eZ+pyugN8/187FGvhrFUdKw==
X-Received: by 2002:a5d:43c7:: with SMTP id v7mr5029182wrr.32.1576008891731;
 Tue, 10 Dec 2019 12:14:51 -0800 (PST)
Received: from x230 ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id z6sm4807909wrw.36.2019.12.10.12.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 12:14:51 -0800 (PST)
Date: Tue, 10 Dec 2019 21:14:49 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Message-ID: <20191210201449.GA1451402@x230>
References: <20191210201321.1430984-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210201321.1430984-1-petr.vorel@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] musl: travis build and include fixes
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

for a record: Travis build:
https://travis-ci.org/pevik/ltp/builds/623349812

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
