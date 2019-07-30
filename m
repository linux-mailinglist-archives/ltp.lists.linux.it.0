Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0337B7A5C5
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 12:15:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7DA213C1D71
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 12:15:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 6DAD63C1D22
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 12:14:56 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1525C600BDD
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 12:14:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 144D3C055673
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 10:14:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08A6F19C6A
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 10:14:54 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id F0CE618089C8;
 Tue, 30 Jul 2019 10:14:53 +0000 (UTC)
Date: Tue, 30 Jul 2019 06:14:53 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1049532097.3289438.1564481693647.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2dqE8Ad_r+vnrd0BnBoyOO9GTLoE20SPSQtV7mbr-Yabg@mail.gmail.com>
References: <6db4a928733290dca3b2e4b4a27f1cb69d805401.1563959090.git.jstancek@redhat.com>
 <CAEemH2dqE8Ad_r+vnrd0BnBoyOO9GTLoE20SPSQtV7mbr-Yabg@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.2]
Thread-Topic: syslog: fix sporadic failures due to rate-limitting
Thread-Index: Dq0GKR9zL4+PqO/a88da4OzvwrSqUw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 30 Jul 2019 10:14:54 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syslog: fix sporadic failures due to
 rate-limitting
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> Hi Jan,
> 
> On Wed, Jul 24, 2019 at 5:07 PM Jan Stancek <jstancek@redhat.com> wrote:
> >
> > Some distros (Fedora30) do not have rsyslog installed by default.
> > Also some test environments generate a lot of messages before they
> > start syslogs tests.
> >
> > This creates a problem if rsyslog is using imjournal, because by default
> > rate-limitting is enabled. If there is a big backlog of messages
> > prior to running syslog tests, some messages from tests may be dropped.
> 
> I'm not sure if I understand this situation, from your description, if
> the rsyslog is not installed,

OK, that might be specific to our harness. We install rsyslog before LTP runs.
My point was that rsyslog wasn't running when system started, and therefore
the backlog kept on growing.

> then the /etc/rsyslog.conf will not exist, so how does the rsyslog
> using imjournal to effect on the test cases? Shouldn't it choose
> syslog or syslog-ng for testing?
> 
> if [ "$SYSLOG_DAEMON" = "syslog" ]; then
>         CONFIG_FILE="/etc/syslog.conf"
> elif [ "$SYSLOG_DAEMON" = "syslog-ng" ]; then
>         CONFIG_FILE="/etc/syslog-ng/syslog-ng.conf"
> elif [ "$SYSLOG_DAEMON" = "rsyslog" ]; then
>         ....
> fi
> 
> And from my test, if I remove(#rpm -e rsyslog) the rsyslog from
> system, this test will choose to go
> syslog-ng(/etc/syslog-ng/syslog-ng.conf) way to test. unfoutananly
> that always failed as:
> 
> --------------------------
> syslog02    0  TINFO  :  Test if messages of all levels are logged.
> syslog02    0  TINFO  :  For each level, a separate configuration file is
> syslog02    0  TINFO  :  created and that will be used as syslog.conf file.
> syslog02    0  TINFO  :  testing whether messages are logged into log file
> syslog02    0  TINFO  :  Doing level: emerg...
> syslog02    0  TINFO  :  restarting syslog daemon
> Broadcast message from
> systemd-journald@intel-chiefriver-02.khw2.lab.eng.bos.redhat.com (Tue
> 2019-07-30 09:42:24 EDT):
> syslogtst[26081]: syslogtst: mail emerg test.
> syslog02    1  TFAIL  :  ltpapicmd.c:188: ***** Level emerg failed *****
> syslog02    0  TINFO  :  Doing level: alert...
> syslog02    0  TINFO  :  restarting syslog daemon
> syslog02    2  TFAIL  :  ltpapicmd.c:188: ***** Level alert failed *****
> syslog02    0  TINFO  :  Doing level: crit...
> syslog02    0  TINFO  :  restarting syslog daemon
> syslog02    3  TFAIL  :  ltpapicmd.c:188: ***** Level crit failed *****
> syslog02    0  TINFO  :  Doing level: err...
> syslog02    0  TINFO  :  restarting syslog daemon
> syslog02    4  TFAIL  :  ltpapicmd.c:188: ***** Level err failed *****
> syslog02    0  TINFO  :  Doing level: warning...
> syslog02    0  TINFO  :  restarting syslog daemon
> syslog02    5  TFAIL  :  ltpapicmd.c:188: ***** Level warning failed *****
> syslog02    0  TINFO  :  Doing level: notice...
> syslog02    0  TINFO  :  restarting syslog daemon
> syslog02    6  TFAIL  :  ltpapicmd.c:188: ***** Level notice failed *****
> syslog02    0  TINFO  :  Doing level: info...
> syslog02    0  TINFO  :  restarting syslog daemon
> syslog02    7  TFAIL  :  ltpapicmd.c:188: ***** Level info failed *****
> syslog02    0  TINFO  :  Doing level: debug...
> syslog02    0  TINFO  :  restarting syslog daemon
> syslog02    8  TFAIL  :  ltpapicmd.c:188: ***** Level debug failed *****
> syslog02    0  TINFO  :  restarting syslog daemon
> 
> > Easy way to reproduce is to stop rsyslog, delete imjournal.state,
> > run kmsg01 test couple times and then run some syslog test:
> >   Jul 23 15:05:13 ... begin to drop messages due to rate-limiting
> >   Jul 23 15:05:21 ... 47006 messages lost due to rate-limiting
> > Messages make it to systemd journal, but not to log configured in rsyslog.
> 
> I didn't reproduce this problem, if I stop rsyslog(`systemctl stop
> rsyslog`) by manual, the test will enable it automatically:
> 
> ---------------------
> syslog02    0  TINFO  :  restarting syslog daemon
> ...
> syslogtst[26848]: syslogtst: mail emerg test.
> syslog02    1  TPASS  :  ***** Level emerg passed *****
> ------------------------
> 
> or maybe I missed something?

Have you followed all the steps?
- stop rsyslog
- delete imjournal.state
- run kmsg01 couple times
- run syslog01

> 
> --
> Regards,
> Li Wang
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
