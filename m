Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E3C7A557
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 12:01:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9DEB53C1D65
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 12:01:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 496293C1D1C
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 12:01:19 +0200 (CEST)
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 24DFF14016CF
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 12:01:18 +0200 (CEST)
Received: by mail-ua1-f66.google.com with SMTP id c4so25202367uad.1
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 03:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I4sGyLo96hdhFdtazRo1C7zKjtqIWJlpjy8Yq9ehAzQ=;
 b=HiEBgjXyBp1WurjfMX2Yf+eAr5+8fr2zQ/LE5o9a5syXoCX0qA6Qkl7aQJc72E5+E9
 fDGUZl4lKugk5LJ2N9QvL2W33X12i9LCxcZLLy5v1x9IJEnPnqJH1+slUtmyamDv6a57
 UH3MMp6+bbUlKPFvqDqc/MpaiveItakk8Kq5wAWzdcLkd2R/Eyb04DKgd1xtqINlLOgc
 I2tqK6XWQXaqbp3ZBr/eNzLhFfXFxitVjQgRMSuHhrghy2tDlVI+95uYW8WHbdW2tS4t
 +Nuu51rrZLYjLjRIDIkbtdnDVDaWho4acBCngMHlLEe731YkMf8XDY2QuXGCs0DZ9m0J
 pnfA==
X-Gm-Message-State: APjAAAUWbb4Euv8qeSFZ/MuDgwcfz7zM7rSUvK+5hV1uZyQygnirp8ei
 xG8XyEYtGdYXgUmYtYf/JkUAFK18890ysRENkIlcOw==
X-Google-Smtp-Source: APXvYqwHKxSLtclpJ5tBqpfJ2O97f9yJALFcePJDQS+jZJsz2aOAFbCa21YlfZ2GXpD4CFRMfNY10Qa7cLnuctIIphY=
X-Received: by 2002:ab0:74c7:: with SMTP id f7mr14374430uaq.106.1564480876963; 
 Tue, 30 Jul 2019 03:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <6db4a928733290dca3b2e4b4a27f1cb69d805401.1563959090.git.jstancek@redhat.com>
In-Reply-To: <6db4a928733290dca3b2e4b4a27f1cb69d805401.1563959090.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 30 Jul 2019 18:01:06 +0800
Message-ID: <CAEemH2dqE8Ad_r+vnrd0BnBoyOO9GTLoE20SPSQtV7mbr-Yabg@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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

Hi Jan,

On Wed, Jul 24, 2019 at 5:07 PM Jan Stancek <jstancek@redhat.com> wrote:
>
> Some distros (Fedora30) do not have rsyslog installed by default.
> Also some test environments generate a lot of messages before they
> start syslogs tests.
>
> This creates a problem if rsyslog is using imjournal, because by default
> rate-limitting is enabled. If there is a big backlog of messages
> prior to running syslog tests, some messages from tests may be dropped.

I'm not sure if I understand this situation, from your description, if
the rsyslog is not installed,
then the /etc/rsyslog.conf will not exist, so how does the rsyslog
using imjournal to effect on the test cases? Shouldn't it choose
syslog or syslog-ng for testing?

if [ "$SYSLOG_DAEMON" = "syslog" ]; then
        CONFIG_FILE="/etc/syslog.conf"
elif [ "$SYSLOG_DAEMON" = "syslog-ng" ]; then
        CONFIG_FILE="/etc/syslog-ng/syslog-ng.conf"
elif [ "$SYSLOG_DAEMON" = "rsyslog" ]; then
        ....
fi

And from my test, if I remove(#rpm -e rsyslog) the rsyslog from
system, this test will choose to go
syslog-ng(/etc/syslog-ng/syslog-ng.conf) way to test. unfoutananly
that always failed as:

--------------------------
syslog02    0  TINFO  :  Test if messages of all levels are logged.
syslog02    0  TINFO  :  For each level, a separate configuration file is
syslog02    0  TINFO  :  created and that will be used as syslog.conf file.
syslog02    0  TINFO  :  testing whether messages are logged into log file
syslog02    0  TINFO  :  Doing level: emerg...
syslog02    0  TINFO  :  restarting syslog daemon
Broadcast message from
systemd-journald@intel-chiefriver-02.khw2.lab.eng.bos.redhat.com (Tue
2019-07-30 09:42:24 EDT):
syslogtst[26081]: syslogtst: mail emerg test.
syslog02    1  TFAIL  :  ltpapicmd.c:188: ***** Level emerg failed *****
syslog02    0  TINFO  :  Doing level: alert...
syslog02    0  TINFO  :  restarting syslog daemon
syslog02    2  TFAIL  :  ltpapicmd.c:188: ***** Level alert failed *****
syslog02    0  TINFO  :  Doing level: crit...
syslog02    0  TINFO  :  restarting syslog daemon
syslog02    3  TFAIL  :  ltpapicmd.c:188: ***** Level crit failed *****
syslog02    0  TINFO  :  Doing level: err...
syslog02    0  TINFO  :  restarting syslog daemon
syslog02    4  TFAIL  :  ltpapicmd.c:188: ***** Level err failed *****
syslog02    0  TINFO  :  Doing level: warning...
syslog02    0  TINFO  :  restarting syslog daemon
syslog02    5  TFAIL  :  ltpapicmd.c:188: ***** Level warning failed *****
syslog02    0  TINFO  :  Doing level: notice...
syslog02    0  TINFO  :  restarting syslog daemon
syslog02    6  TFAIL  :  ltpapicmd.c:188: ***** Level notice failed *****
syslog02    0  TINFO  :  Doing level: info...
syslog02    0  TINFO  :  restarting syslog daemon
syslog02    7  TFAIL  :  ltpapicmd.c:188: ***** Level info failed *****
syslog02    0  TINFO  :  Doing level: debug...
syslog02    0  TINFO  :  restarting syslog daemon
syslog02    8  TFAIL  :  ltpapicmd.c:188: ***** Level debug failed *****
syslog02    0  TINFO  :  restarting syslog daemon

> Easy way to reproduce is to stop rsyslog, delete imjournal.state,
> run kmsg01 test couple times and then run some syslog test:
>   Jul 23 15:05:13 ... begin to drop messages due to rate-limiting
>   Jul 23 15:05:21 ... 47006 messages lost due to rate-limiting
> Messages make it to systemd journal, but not to log configured in rsyslog.

I didn't reproduce this problem, if I stop rsyslog(`systemctl stop
rsyslog`) by manual, the test will enable it automatically:

---------------------
syslog02    0  TINFO  :  restarting syslog daemon
...
syslogtst[26848]: syslogtst: mail emerg test.
syslog02    1  TPASS  :  ***** Level emerg passed *****
------------------------

or maybe I missed something?

--
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
