Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 896217BC77
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 11:02:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E6D533C1D42
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 11:02:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id AC9BF3C1826
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 11:02:38 +0200 (CEST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CC023601A78
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 11:02:37 +0200 (CEST)
Received: by mail-ua1-f42.google.com with SMTP id 34so26666101uar.8
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 02:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nc2KYJCDAJ3fZAs0s9uayhe3SP2FqSFeI/gr7W4Yisw=;
 b=ij0rJUkJDsXkm6h3M2PCd3Zk0cTBzjapsymlubCG9tCgFRosQYrZUyLLezrs14C14t
 t2lNlLZO4dx1l0HCERFku7r+067x+oIR3ucX/oBCAvXndcvUZna6GXYJ8MjRMO9Q7rAJ
 f1oSqaafk+igr9EZ4jttvrzUqYOdW7BxDLZ4GZOtUbBtugMu19Hoo1lIRoaDstVlYRiT
 2PVVG4mwMYqEYQ6LHaplCiacLT2O1dIJudoBhIyT4n7gmC4U94jbusRlu74XlUaX4QJh
 OCJOUd7IPlX92wCyv4AvqhebOsmDbNkd8m2u31/AfmThYmb5eyrmDZuFYLc8GDzcQ57p
 J5/g==
X-Gm-Message-State: APjAAAURfZ7s3YsTvn1geXzt82wplPiSYcM/q1lLXHcmQQBm+k6uwmR3
 tWDpXE/qDNUNme9IFHqh4maXQCEFwV8Uuc8LZlmntw==
X-Google-Smtp-Source: APXvYqwyGmQge8ISg4y1ZuLWKPMfolEwe/qmHFA7BwCqtpVUK0b75hVUk9Jn7/dOJJc50B3MIchCtTOYXAe5bBmmU7g=
X-Received: by 2002:ab0:67d6:: with SMTP id w22mr8886524uar.68.1564563756691; 
 Wed, 31 Jul 2019 02:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <6db4a928733290dca3b2e4b4a27f1cb69d805401.1563959090.git.jstancek@redhat.com>
 <CAEemH2dqE8Ad_r+vnrd0BnBoyOO9GTLoE20SPSQtV7mbr-Yabg@mail.gmail.com>
 <1049532097.3289438.1564481693647.JavaMail.zimbra@redhat.com>
In-Reply-To: <1049532097.3289438.1564481693647.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 31 Jul 2019 17:02:25 +0800
Message-ID: <CAEemH2cDDgKrhxDwNgUq_yg_=v0YKXhHWBVugfg4Wy6UKOuNcA@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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

> Have you followed all the steps?
> - stop rsyslog
> - delete imjournal.state
> - run kmsg01 couple times
> - run syslog01

Finally, I run more times for ksm01 to make a large backlog of
messages then reproduced it. After applying your patch, the problem
does not appear anymore.  So, ACK for this patch.

---------- Reproduce Log -----------
# cat runtest/wangli
kmsg01 kmsg01
kmsg01 kmsg01
kmsg01 kmsg01
kmsg01 kmsg01
kmsg01 kmsg01
syslog01 syslog01

# systemctl stop rsyslog; rm -fr /var/lib/rsyslog/*; ./runltp -f wangli
syslog01 FAIL

# journalctl
...
Jul 31 04:53:18 hp-dl385pg8-11.rhts.eng.pek2.redhat.com
rsyslogd[3336]: imjournal from <hp-dl385pg8-11:restraintd>: begin to
drop messages due to rate-limiting
Jul 31 04:53:19 hp-dl385pg8-11.rhts.eng.pek2.redhat.com
syslogtst[3341]: syslogtst: mail info test.
Jul 31 04:53:21 hp-dl385pg8-11.rhts.eng.pek2.redhat.com systemd[1]:
Stopping System Logging Service...
Jul 31 04:53:21 hp-dl385pg8-11.rhts.eng.pek2.redhat.com
rsyslogd[3336]: imjournal: 63528 messages lost due to rate-limiting

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
