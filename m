Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEC018F176
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 10:12:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 05ADC3C4E54
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 10:12:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id BA86B3C0430
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 10:12:14 +0100 (CET)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 11DE11000C5E
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 10:12:14 +0100 (CET)
Received: by mail-il1-x12f.google.com with SMTP id t11so2533976ils.1
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 02:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=fBmUoBYJ9p9e82qeuskiQeQeyTp3fDyYxPjTY8izdck=;
 b=KAhVO43hLaMW/AS/K4Wf/xn5AJh1uw7Dj7lHrP1vgT8O/9zT1QxPigJoJN0Es+t3KT
 5Gvo+hqMS67VLounJosMLWFOFQ9//9pcooqSrJXXKefCPPyv25TF3X0m0Ko7ovd+kAxz
 nbxBvJQ6jBl8MmX2yaoN4pYQ5bNj8rrNB1AlPv3MpyHR0kFZY350aEBvgAsf9ea5K6vv
 9OHqrlzYBVti1PrN7sskOByDYFxLpQgBnIwNQGqu4LIXYH9Nnh+Rr4pg57M1XUVJvYdv
 CLMZMP6cjwnW16lAoI3t7G28jRwxEdLLSGFZh6IgfT3itswj3QfvxR84w6Bm49JUTHCi
 /nng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=fBmUoBYJ9p9e82qeuskiQeQeyTp3fDyYxPjTY8izdck=;
 b=VnpCJyX7BAV+u2bAPmB52uN+k7W9xeBLZxGjHmXquJWM9Nbi/kyy93RRFRnf3ZWNfK
 lTp7OkP9AP5jNoRuHxqk34we5ma+dPLEYN21ykfEhnsaU28MEhU6JGDBZorsOlTzhroT
 2HQq/ayKQTBb/Fq6b+HfJEvJ2IM1ViaNYWhFWNzXt+tzY5NCMsaV78ZLcl4aCjxHq6Dr
 sitVYItaunSiaXfUlqJTsaMLzwuFcRn0VNKAHnbPxirbbjmLh9DsSdge0oM18ofSztIK
 1gq+NKuvViJtHtS+5s3JMK6edTUbmH+GQyJarPZYJ9Djy0SE4EVSga1eXkF2v95hT00r
 UeTg==
X-Gm-Message-State: ANhLgQ2hvcsKD5eykWArz3QIVJkO+qvm7olV57xpHPd4Hnp1KAX4V+27
 DpSXiKEWhhd0jMEW234KHW5lIWkmgSAF+ONe4xGDyu7HQPc=
X-Google-Smtp-Source: ADFU+vsABGFRggockaJ8eo/nCh4jX1xWRPW5ksCMS+xMuPHunUA4DG8FC+IEE0AnYaY6FomNXg8StyOvncsK57HFmtc=
X-Received: by 2002:a92:b704:: with SMTP id k4mr19687478ili.31.1584954732255; 
 Mon, 23 Mar 2020 02:12:12 -0700 (PDT)
MIME-Version: 1.0
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Mon, 23 Mar 2020 14:42:01 +0530
Message-ID: <CAKohpokaPiyGFkAXgG2oy_f5UGMCtsVUUAf4vA3Npa2ixAbNig@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] Query: Supporting time64 syscalls
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi guys,

I was looking to start working on the time64 syscalls
(like clock_gettime64, timerfd_settime64, etc) and
was looking for your suggestions on how to proceed on
the same.

AFAIU, the only difference is that the argument is 64 bit now
instead of 32 bit and so I don't think I should be adding new
tests but reusing the existing ones for both 32 bit and 64 bit
variants.

Thanks.

--
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
