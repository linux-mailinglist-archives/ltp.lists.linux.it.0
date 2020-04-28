Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 798C41BBA3F
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 11:47:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 744B33C5F49
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 11:47:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 037BF3C282E
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 11:47:50 +0200 (CEST)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4202460029F
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 11:47:50 +0200 (CEST)
Received: by mail-pg1-x535.google.com with SMTP id l20so2131224pgb.11
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 02:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=3CIQIGmNyHeEZB+eA/33fW/MUUZTzZqPfwHcEeDkaa4=;
 b=XlvRxvy15ncXu37Y4XxWAAwSZ0nPHZry+58Cd4BQXOfepanJmfV780N7ewUIS1igv+
 sDbitecGBQ+jsk+bEDh/mWQV8dvc0mWO+bMdBItYatk9QwinytK8K8r2JyTv4BYOP/Nl
 UWjXxWUNOGhCfTLjbXcU35zfJrhIAxR6GRyhZt2rZCndsMHrFBytdwvjXn1VgE1W865P
 AmyE6DI1cR58BCgdyL95eVZcz96OXRa8RROEFjUJaNYAXqgW9dWI9ASc19BKc6owqOci
 SVSNf8vgX8y1OqUBfwTw4IKfhwcfSojLNWa7lyK2shgvqTXmK41cFcMRr4Lt/6jxCSX2
 28wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=3CIQIGmNyHeEZB+eA/33fW/MUUZTzZqPfwHcEeDkaa4=;
 b=PuOJCaewmXZckXqrp4WWOieUNm7pjKhA5NmISs7tZYwkCeh7lqu5BUDf0D1axcX7yX
 crrFEC8whuEVUQyrA/waGfHcXSCg/xnwkzJTg9vIwarcH5526h4ESeJFN4PWCYmcysro
 pD2GdiSyMeO4zACAMJPn5WS7jMcBfNGjXpJoozdCcaxYlF817aKSBxStksiPmd1gvdcV
 QYLiGvNoGMLPQi8Tpyyn9yLUGvnzDig9SQttoRWZptTRrmf5gEe6uql7aSKS2ygAiwZZ
 Cbsclpa3lRER0f7Ov9JgnWLG3V2fmcwf42D/MBuBYsFfknR9MR9uHP6M+eRmjEdRvGsd
 GfiQ==
X-Gm-Message-State: AGi0PuaE2aAZVTW8TUs0qVw1DcS408+5W7/ADCkN5x6dBtGXfvnXR7vd
 SpzC7qwxBCjrq5nwj8chDHCC7Alj3Gc=
X-Google-Smtp-Source: APiQypLL1mS79MIFNYiQ8Ljypl4bKYFQyurKR75LmSUdEqsLwNnHSisYVECi+pnYJHR1XjM7O7nzsQ==
X-Received: by 2002:a63:1d4a:: with SMTP id d10mr27491039pgm.188.1588067268510; 
 Tue, 28 Apr 2020 02:47:48 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id 20sm14509780pfx.116.2020.04.28.02.47.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Apr 2020 02:47:47 -0700 (PDT)
Date: Tue, 28 Apr 2020 15:17:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Message-ID: <20200428094745.io5fni2txzl6n37q@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] What is wrong with this program ?
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
Cc: vincent.guittot@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

#include "tst_test.h"

static void run(void)
{
	int fd;

	fd = SAFE_OPEN("file", O_RDWR | O_CREAT);
	SAFE_CLOSE(fd);
	fd = SAFE_OPEN("file", O_RDWR | O_CREAT);
}

static struct tst_test test = {
	.test_all = run,
	.needs_tmpdir = 1,
};


It fails with:

safe_macros.c:230: BROK: foo.c:9: open(file,66,01) failed: EACCES (13)

if run as a normal user and passes with sudo.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
