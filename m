Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4A93FA12C
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 23:30:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B27B3C9C8B
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 23:30:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D5DAB3C2D6A
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 23:30:06 +0200 (CEST)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2CB98201001
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 23:30:06 +0200 (CEST)
Received: by mail-pl1-x629.google.com with SMTP id x16so3082353pll.2
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 14:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KvR0cFjmaEwCTvDjSRBS97kq4es6eQEEooSk8h9VrwQ=;
 b=z09sILYSUgR2jbRQUNHUlXXlP8e5aJ5eybSY8N/2+jPXjK3ZOkt8eU9O4ionKHszbw
 WXryyrThfE4qe34HYqiQjQfHemlcoMzmGzIRMPC6rUyt048rSe7g80oEyiTkNngyaoSH
 mFEpL/0P22Lk15ttHkLT8kEgomv0Q6/j+H/uNN9tF24vgsPfrJs5T9+kfK/PLPGvoe/N
 F9yNVsHfsW10hItnN0bUQ7Ent4tsX1OQqsTrtJuX3GGMn+mGoqxadaAyeRBW2AUJMjJw
 TMTuxUFma38xCXb6+YkwvdfuULzZvVeZm1s7AhTRr9iBGeVbi1mo4SwlbJcQLc86B9Wc
 F8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KvR0cFjmaEwCTvDjSRBS97kq4es6eQEEooSk8h9VrwQ=;
 b=rRUQ6rVFQA6YSEuQbzBP8zIDZYTWASBXGp056f7cAMH6LG6cQ9vaq7o3245KBINIcD
 KPPEh/qOuU38xZBdwFeIAeVQGKk8V4dszD0Skn/eVA0PqhMPd1oID6PqMXm4bSCcjTjB
 SKJIKsU5hSCcsNdxqEI3MyB91FQ4Pq4B63bvdaUl0dzO8hNwJxjxkgX4fdD6TyVTJmaV
 JnSJEROHNfXHGVQCWjGy/O6b5Jz+le9UDXW5iVlaDwizHpKC17HDb1PDK7wo4R7ECswq
 pRbhPs5WRWTERl5metOI00R+rfHvTtqkcZi3sPVqim9I5f9szYFY+qAjTFutr11dlW1e
 hc1w==
X-Gm-Message-State: AOAM533n47GJkXo56j3K9nmAhcEhVHYfRxmLd0q1DnvizVCYcu6es9RQ
 tC3WNCtAeeHqA6mD2z8L8MiLuw1CVruGYw==
X-Google-Smtp-Source: ABdhPJz6cTBtiOMp7VKk2+JNGYJ0jE01saVjdJm3fFm8z7YECNsOhlJeMv15s9TuuQl1gpgvDjvlWw==
X-Received: by 2002:a17:902:c3c6:b0:138:80f2:f642 with SMTP id
 j6-20020a170902c3c600b0013880f2f642mr9509811plj.42.1630099804077; 
 Fri, 27 Aug 2021 14:30:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 u22sm6645211pfi.143.2021.08.27.14.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 14:30:03 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 27 Aug 2021 21:29:59 +0000
Message-Id: <20210827212959.1633818-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [RFC][PATCH] memcg/control: Fix dropped messages from fifo to
 avoid leaving mem_process running
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
Cc: John Stultz <john.stultz@linaro.org>, YongQin Liu <yongqin.liu@linaro.org>,
 Suren Baghdasaryan <surenb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Todd Kjos <tkjos@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

(Sorry for the resend, had to subscribe to the list)

In testing with AOSP, I ran across some odd behavior where
the memcg_control_test.sh would get stuck in zombie state,
and the mem_process process would be stuck running.

After some debugging, I found mem_process was not getting
the quit message ("x") over the status_pipe fifo, and would
keep running after the test was finished.

In the memcg_control_test.sh script, there is some curious
behavior, as after it sends the allocate message ("m") and
then checks to see if the mem_process has been killed, if it
was not killed, it again sends the allocate ("m") message,
which I don't quite understand the reason for:
  https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/controllers/memcg/control/memcg_control_test.sh#L72

The memcg_control_test.sh then immediately sends the quit
message ("x"):
  https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/controllers/memcg/control/memcg_control_test.sh#L73

Which is what the mem_process was not receiving.

Removing the second allocate ("m") message seemed to avoid the
problem. And digging further this seems to be due to the fact
that the mem_process is open/read/closing the fifo each loop
iteration:
  https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/controllers/memcg/control/mem_process.c#L109

My understanding is fifos only function when both sides are
open, having two commands sent quickly in succession, the first
will be read but as the fifo is then closed, the second message
may get dropped before the fifo is re-opened and read from.

Thus to avoid this, this patch reworks the fifo handling so
the mem_process will create the fifo, open it, and then
do its main loop processing keeping the fifo open.

Once it receieves a quit message, it will then close and
remove the fifo.

So far this has resolved the issue for me.
I don't pretend to be a fifo expert, so feedback or suggestions
for other approaches would be welcome!

Cc: Stanislav Kholmanskikh <stanislav.kholmanskikh@oracle.com>
Cc: Jan Stancek <jstancek@redhat.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: YongQin Liu <yongqin.liu@linaro.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 .../controllers/memcg/control/mem_process.c      | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/testcases/kernel/controllers/memcg/control/mem_process.c b/testcases/kernel/controllers/memcg/control/mem_process.c
index efe2fb3e3..6c1b36ca6 100644
--- a/testcases/kernel/controllers/memcg/control/mem_process.c
+++ b/testcases/kernel/controllers/memcg/control/mem_process.c
@@ -101,25 +101,20 @@ void mem_map(void)
 /*
  * done: retrieve instructions from the named pipe
  */
-char action(void)
+char action(int fd)
 {
 	char ch;
-	int fd;
-
-	if ((fd = open(STATUS_PIPE, O_RDONLY)) == -1)
-		err(6, "Error opening named pipe");
 
 	if (read(fd, &ch, 1) == -1)
 		err(7, "Error reading named pipe");
 
-	close(fd);
-
 	return ch;
 }
 
 int main(int argc, char **argv)
 {
 	int ret;
+	int fd;
 	char ch;
 
 	process_options(argc, argv);
@@ -129,13 +124,18 @@ int main(int argc, char **argv)
 	if (ret == -1 && errno != EEXIST)
 		errx(1, "Error creating named pipe");
 
+	if ((fd = open(STATUS_PIPE, O_RDONLY)) == -1)
+		err(6, "Error opening named pipe");
+
 	do {
-		ch = action();
+		ch = action(fd);
 
 		if (ch == 'm')
 			mem_map();
 	} while (ch != 'x');
 
+	close(fd);
+
 	remove(STATUS_PIPE);
 
 	return 0;
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
