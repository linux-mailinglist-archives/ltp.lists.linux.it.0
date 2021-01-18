Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AA02B2F9B0B
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 09:14:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 625773C30BE
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 09:14:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id CA60A3C25D8
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 09:13:59 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 42AD2140007F
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 09:13:58 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 57B3FACF4;
 Mon, 18 Jan 2021 08:13:58 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 18 Jan 2021 09:13:50 +0100
Message-Id: <20210118081350.21418-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] travis: Temporary workaround for pull rate limit
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Use mirror.gcr.io mirror to temporary workaround pull rate limit in
docker registry. Correct solution is to migrate to Github Actions.

See also: #761

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

not a final solution for #761, just to get Travis quickly working.

Kind regards,
Petr

 .travis.yml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index edf627c33..245b790de 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -85,6 +85,14 @@ matrix:
 
 before_install:
     - df -hT
+    # pull rate limit workaround
+    - tmpdaemon=$(mktemp)
+    - sudo jq '."registry-mirrors" += ["https://mirror.gcr.io"]' /etc/docker/daemon.json > $tmpdaemon
+    - sudo mv $tmpdaemon /etc/docker/daemon.json
+    - sudo systemctl daemon-reload
+    - sudo systemctl restart docker
+    - docker system info
+    # ltp
     - DIR="/usr/src/ltp"
     - printf "FROM $DISTRO\nRUN mkdir -p $DIR\nWORKDIR $DIR\nCOPY . $DIR\n" > Dockerfile
     - cat Dockerfile
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
