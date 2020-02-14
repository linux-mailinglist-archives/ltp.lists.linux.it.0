Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1677915D696
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Feb 2020 12:36:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 882EF3C2555
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Feb 2020 12:36:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 805FA3C13BB
 for <ltp@lists.linux.it>; Fri, 14 Feb 2020 12:36:09 +0100 (CET)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 573F81402FA1
 for <ltp@lists.linux.it>; Fri, 14 Feb 2020 12:36:06 +0100 (CET)
Received: by mail-pf1-x443.google.com with SMTP id n7so4781834pfn.0
 for <ltp@lists.linux.it>; Fri, 14 Feb 2020 03:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KWOaIAl9rUtcg2q98Gmbqb2zTyhu10XOjPrNiY76ciY=;
 b=KUYZa+zmwl6ZM2EdfKJN4fVK9LKutEyjmVjL6M+Tu/Hx+8cBOPi2moCq5D1O8jRgFU
 UwBKXVLRYw/eVUjH2hkJMqDKpATbQhXtqFbkg290yj3nHBmscW++kLQrPfjA39UY3eaJ
 l6yxntT4nlyfam046fSRhJutGmqC9xtIwbAP4WdZNBfAlHLwdkNIBL9qwy2DY6aPvg+5
 G9S5tLlc4Ckvs8catlRnqFoN7hlKl5/WST5rKy3YoAvindz7Dcy9a2FpwZMOk2c9Dpfa
 qIGhadH2FoZDGwqZuH/fp0iOZe6xAfM+q79/k8ubLYMIqaCP0CFa1FsQ793gjmSYK3rE
 2s3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KWOaIAl9rUtcg2q98Gmbqb2zTyhu10XOjPrNiY76ciY=;
 b=ATLm+KBVYP1ehgDx2DazfD6exwE39hY3KzNJnjDxNnw+lm3L52hHu9PvVnpUg6UVLQ
 0dzwKUKrph9pfXm6y3W0M0VkcSV1+vSRHgpDxmuLZWBVRUCuLvomeZuHt9hnK2ARl3U+
 e7T3eI+BXhzggg69kTkZ4NApthoc7aUpALYItjtRrkjoD6xz6RfmbLnoq/q2iONno46c
 jqGk/BJDtdzBFabNM+DL7/NFhn0F8KIdNErvsjNd5TesfygNR2TQsPlzPHocUJpZixDe
 JsljRGvI1cuAWqLIJ5Wu2jLDfJVw0fkOa9DVb0p0PVEJTt7n+WNGP8QiQDaKM7NSZEBD
 oY7A==
X-Gm-Message-State: APjAAAXe5FZEJjMKWNUB7Uj9kHYihFo2j82qOqhwEsX3y26403wuuN8Y
 vZiEAD2u3m9M1M9MC2HHXsa95q/Pr60=
X-Google-Smtp-Source: APXvYqzi9HoT5KZq4bQI4yZqMSpTQINk0fUvAppgYug1aduYabceEmcJBhSVbHF/VbIHZ5H4NQwFRQ==
X-Received: by 2002:a63:d207:: with SMTP id a7mr3031426pgg.225.1581680164611; 
 Fri, 14 Feb 2020 03:36:04 -0800 (PST)
Received: from localhost ([122.167.210.63])
 by smtp.gmail.com with ESMTPSA id q21sm6724220pff.105.2020.02.14.03.36.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Feb 2020 03:36:03 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Fri, 14 Feb 2020 17:05:49 +0530
Message-Id: <cover.1581680021.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 0/7] Add new LTP tests related to fsmount family of
 syscalls
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it,
 Vikas.Kumar2@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

This series adds a bunch of LTP tests related to fsmount family of
syscalls.

Thanks

--
viresh

Viresh Kumar (7):
  lapi/fsmount: Add definitions for fsmount related syscalls
  syscalls/fsopen: New tests
  syscalls/fsconfig: New tests
  syscalls/fsmount: New tests
  syscalls/move_mount: New tests
  syscalls/fspick: New tests
  syscalls/open_tree: New tests

 configure.ac                                  |   6 +
 include/lapi/fsmount.h                        | 134 ++++++++++++++++++
 runtest/syscalls                              |  18 +++
 testcases/kernel/syscalls/fsconfig/.gitignore |   2 +
 testcases/kernel/syscalls/fsconfig/Makefile   |   6 +
 .../kernel/syscalls/fsconfig/fsconfig01.c     |  77 ++++++++++
 .../kernel/syscalls/fsconfig/fsconfig02.c     |  97 +++++++++++++
 testcases/kernel/syscalls/fsmount/.gitignore  |   2 +
 testcases/kernel/syscalls/fsmount/Makefile    |   6 +
 testcases/kernel/syscalls/fsmount/fsmount01.c |  71 ++++++++++
 testcases/kernel/syscalls/fsmount/fsmount02.c |  83 +++++++++++
 testcases/kernel/syscalls/fsopen/.gitignore   |   2 +
 testcases/kernel/syscalls/fsopen/Makefile     |   6 +
 testcases/kernel/syscalls/fsopen/fsopen01.c   |  71 ++++++++++
 testcases/kernel/syscalls/fsopen/fsopen02.c   |  56 ++++++++
 testcases/kernel/syscalls/fspick/.gitignore   |   2 +
 testcases/kernel/syscalls/fspick/Makefile     |   6 +
 testcases/kernel/syscalls/fspick/fspick01.c   | 104 ++++++++++++++
 testcases/kernel/syscalls/fspick/fspick02.c   | 110 ++++++++++++++
 .../kernel/syscalls/move_mount/.gitignore     |   2 +
 testcases/kernel/syscalls/move_mount/Makefile |   6 +
 .../kernel/syscalls/move_mount/move_mount01.c |  82 +++++++++++
 .../kernel/syscalls/move_mount/move_mount02.c | 102 +++++++++++++
 .../kernel/syscalls/open_tree/.gitignore      |   2 +
 testcases/kernel/syscalls/open_tree/Makefile  |   6 +
 .../kernel/syscalls/open_tree/open_tree01.c   | 115 +++++++++++++++
 .../kernel/syscalls/open_tree/open_tree02.c   | 110 ++++++++++++++
 27 files changed, 1284 insertions(+)
 create mode 100644 include/lapi/fsmount.h
 create mode 100644 testcases/kernel/syscalls/fsconfig/.gitignore
 create mode 100644 testcases/kernel/syscalls/fsconfig/Makefile
 create mode 100644 testcases/kernel/syscalls/fsconfig/fsconfig01.c
 create mode 100644 testcases/kernel/syscalls/fsconfig/fsconfig02.c
 create mode 100644 testcases/kernel/syscalls/fsmount/.gitignore
 create mode 100644 testcases/kernel/syscalls/fsmount/Makefile
 create mode 100644 testcases/kernel/syscalls/fsmount/fsmount01.c
 create mode 100644 testcases/kernel/syscalls/fsmount/fsmount02.c
 create mode 100644 testcases/kernel/syscalls/fsopen/.gitignore
 create mode 100644 testcases/kernel/syscalls/fsopen/Makefile
 create mode 100644 testcases/kernel/syscalls/fsopen/fsopen01.c
 create mode 100644 testcases/kernel/syscalls/fsopen/fsopen02.c
 create mode 100644 testcases/kernel/syscalls/fspick/.gitignore
 create mode 100644 testcases/kernel/syscalls/fspick/Makefile
 create mode 100644 testcases/kernel/syscalls/fspick/fspick01.c
 create mode 100644 testcases/kernel/syscalls/fspick/fspick02.c
 create mode 100644 testcases/kernel/syscalls/move_mount/.gitignore
 create mode 100644 testcases/kernel/syscalls/move_mount/Makefile
 create mode 100644 testcases/kernel/syscalls/move_mount/move_mount01.c
 create mode 100644 testcases/kernel/syscalls/move_mount/move_mount02.c
 create mode 100644 testcases/kernel/syscalls/open_tree/.gitignore
 create mode 100644 testcases/kernel/syscalls/open_tree/Makefile
 create mode 100644 testcases/kernel/syscalls/open_tree/open_tree01.c
 create mode 100644 testcases/kernel/syscalls/open_tree/open_tree02.c

-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
