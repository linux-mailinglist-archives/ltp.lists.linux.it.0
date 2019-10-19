Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CA6DD72A
	for <lists+linux-ltp@lfdr.de>; Sat, 19 Oct 2019 09:41:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F0BA03C2351
	for <lists+linux-ltp@lfdr.de>; Sat, 19 Oct 2019 09:41:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id F3A603C22C4
 for <ltp@lists.linux.it>; Sat, 19 Oct 2019 09:41:20 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4B0F0200B7E
 for <ltp@lists.linux.it>; Sat, 19 Oct 2019 09:41:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9660C8553A;
 Sat, 19 Oct 2019 07:41:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 814B460600;
 Sat, 19 Oct 2019 07:41:16 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id D7D7318089DC;
 Sat, 19 Oct 2019 07:41:15 +0000 (UTC)
Date: Sat, 19 Oct 2019 03:41:15 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: ammy.yi@intel.com, alexander.shishkin@linux.intel.com
Message-ID: <1311286607.7121481.1571470875734.JavaMail.zimbra@redhat.com>
In-Reply-To: <1953570088.7121417.1571470108567.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.8]
Thread-Topic: LTP pt_test failing after 38bb8d77d0b9 "perf/x86/intel/pt: Split
 ToPA metadata and page layout"
Thread-Index: j9qJ/TG5JAarLcJjLYhfq641vXqALw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Sat, 19 Oct 2019 07:41:16 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [bug?] LTP pt_test failing after 38bb8d77d0b9
 "perf/x86/intel/pt: Split ToPA metadata and page layout"
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
Cc: vincent.weaver@maine.edu, peterz@infradead.org,
 linux-kernel@vger.kernel.org, eranian@google.com, acme@redhat.com,
 tglx@linutronix.de, jolsa@redhat.com, mingo@kernel.org,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

All variants of pt_test:
  https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/tracing/pt_test/pt_test.c
started failing after:
  38bb8d77d0b9 ("perf/x86/intel/pt: Split ToPA metadata and page layout")

with following error on console/dmesg:
  pt: ToPA ERROR encountered, trying to recover

on Broadwell-EP:

vendor_id       : GenuineIntel
cpu family      : 6
model           : 79
model name      : Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz
stepping        : 1

Regards,
Jan

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
