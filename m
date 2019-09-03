Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C3342A6961
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2019 15:09:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8DF7B3C20BD
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2019 15:09:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 904473C20A7
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 15:09:18 +0200 (CEST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 08F94602290
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 15:08:52 +0200 (CEST)
Received: by mail-lj1-f171.google.com with SMTP id l1so15907428lji.12
 for <ltp@lists.linux.it>; Tue, 03 Sep 2019 06:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=9jG0coLUDO+73FdDxlq8YPaOC9hh+AWm0RYXqTFml1I=;
 b=xxSiLtXBQ3mNG8htqDKd3QZ0frlyKVjAndWO9BeyHShBTdpy4lMxALhbIkmj7rYaIp
 as+X04+teHZtnNk568rvm/g0Ql181zs4o8pRUiOPJPFBDUE70yk9LsCjmYVAdJRHGLYQ
 izmJd2wUQSuG580rotQXH9ECIBak/phpil7OzxV6ynaFCdtvS88k4unyczFF5r8j6ip9
 1B7+HrBeazgC3B1Otou1X+j9YDUmMbDQeUoLMUa3ALF9hQbPIst8SHFfzheWkn80eCan
 Snx3QuaN0t1vspxlhqtFzA4VtV3IGKykHz+R29Q3D7qQ6cwU29vAlUHyU9gmiULJNZp/
 xwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=9jG0coLUDO+73FdDxlq8YPaOC9hh+AWm0RYXqTFml1I=;
 b=sZla3LbKo1wu0QIk7JmUru3KyixpCwEPw4YEB8f6nJ32wdf/8o1QW4sSmPz3D33/wN
 Y7QltVHBLY/fuHXUSVzSg6L20AOEiznEcgX0/g2oHcfdxpYT0RI4e2194xI0HqzyCcRn
 hwj3r5YCO2mDrOvVi7BQid17HcGu1WGnzmqX7JDXKKbqsl5XNKPS3NpM9bNg8scPsivb
 zUB14hp3eZXuPihnLB/iaFzT639uhUGJHjbfbaJqjJA3YUla2pFIJxvtWRUCI6qwQTDj
 rX4A4y9WxMZGzzw8oYQedY8s618hvd1UHn0zT/AL+hr4pLfNUu4v7Kxm0VVB7jQ3A1k8
 7lpw==
X-Gm-Message-State: APjAAAUFQw09OdUvsy4BmOAURbntQ0Le6XVMQzI0qXVVk9NUX6q42KxG
 qQmYkXOuDlpwgfpmAjkLi0apuvrRJ4yXLmgDR+xGGUj2F/u/bA==
X-Google-Smtp-Source: APXvYqyZ0El1Uq8xvr9uy+l08r7rozLqVb6gmqkmI3jv3tHQeHdGNAfPEDToBXZCknBkS2iI821E6ejNOT8spJonWPQ=
X-Received: by 2002:a2e:9b0c:: with SMTP id u12mr3319216lji.26.1567516056920; 
 Tue, 03 Sep 2019 06:07:36 -0700 (PDT)
MIME-Version: 1.0
From: Anders Roxell <anders.roxell@linaro.org>
Date: Tue, 3 Sep 2019 15:07:26 +0200
Message-ID: <CADYN=9J0XpRAXYwcNwj0Qzju6Bafqq9aE1mjYPGPiDPsvvgqbQ@mail.gmail.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] Automated Testing devroom at FOSDEM 2020 poll
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
Cc: Matt Hart <matthew.hart@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello everyone,

We are planning to put together a Automated Testing devroom at FOSDEM
2020 [1] and would like to see if there is any interest in attending
such an event.
If we're not able to put together a set of talks that fills up a (half) day we
shouldn't apply for a devroom.
We have a few people prepared to give talks if the devroom happens.

We would like to know your interest in attending  (or, better yet, make a
proposal to speak or for a discussion session) before 16 September.

Cheers,
Anders
[1] https://fosdem.org/2020/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
