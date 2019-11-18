Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA531007C4
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 16:00:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EAC143C181B
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 16:00:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id DDCAA3C078F
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 16:00:09 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 2AC1D60069F
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 16:00:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574089207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vaa/mw52jnCpQYnahuXb+ih9CaZ4u4pPCdD/rBwDrb0=;
 b=MPVwizGEyoOeRyElMZidwkGg+qO84bCi16KaBpwves3QPPgy+cqA2UPjSXmfLspTxxFYrJ
 syp9VUiJOHAI++CoWJR7VzenjetqGXviyGiVcOvemqeMWF5Lan6FMt/UdEajo9tlVE3dxS
 HhAFYWtJl/iJGPvMZw+DNv5OqGKKVPk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-nkUYQlV6Nka8U0JoI3ZNyA-1; Mon, 18 Nov 2019 10:00:05 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 823328E02F9
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 15:00:04 +0000 (UTC)
Received: from dustball.usersys.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5FBA646D7
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 15:00:03 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 18 Nov 2019 15:59:54 +0100
Message-Id: <cover.1574087532.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: nkUYQlV6Nka8U0JoI3ZNyA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] perf_event_open02 tweaks
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Motivation for this series is patch 3, because this test
fails pretty reliably on Pentium4 systems.

I talked to Jiri Olsa (one of perf maintainers) and he had his
reservations about how test determines number of HW counters -
by looking at time_enabled/time_running. One idea was to create
a single group and keep adding hw events to it until it fails.
This however didn't work on Pentium4 system either and it failed
on 2nd event. He also pointed out, that test will always succeed
when number of hw counter is over-estimated.

I found one workaround, which seems to work on both Pentium4
and more recent CPUs. It replaces comparison of absolute values
with comparison of increments (see patch 3 for details).

Question about validity of this test remains, but workaround in
patch 3 at least should not make things worse.

Jan Stancek (3):
  perf_event_open02: migrate to newlib
  perf_event_open02: make do_work() run for specified time
  perf_event_open02: workaround for Pentium4

 .../syscalls/perf_event_open/perf_event_open02.c   | 402 +++++++++------------
 1 file changed, 168 insertions(+), 234 deletions(-)

-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
