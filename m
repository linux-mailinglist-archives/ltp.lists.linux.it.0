Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C80C712DF6B
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Jan 2020 17:15:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 81D933C23CB
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Jan 2020 17:15:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 266473C1CBB
 for <ltp@lists.linux.it>; Wed,  1 Jan 2020 17:15:21 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 385DC200D00
 for <ltp@lists.linux.it>; Wed,  1 Jan 2020 17:15:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577895318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QIeuG7DhoEDrgrql0Qp4b3x9h38IHg/7/vGEsbkeQFE=;
 b=LBvQqisbBgqBZIk/5E/c8oEbOq2vBjE1iELn+RDHL+Y3pcI8RR1VE21mjotW0zmYL49PLO
 tt8mAaqKjeDvdPoysa5nvq4QQWSlEjFtTegQwFJ9G99/Qe0+6MJ5S+46Qc6ik6jT+a1PTj
 OkzgcChgdIlJM1bwBJOOvNbGfHCdGkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-UjGJAEmuMP2DMdKFz0qxlg-1; Wed, 01 Jan 2020 11:15:14 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB4541005516;
 Wed,  1 Jan 2020 16:15:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8EF660BE2;
 Wed,  1 Jan 2020 16:15:13 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id C593381E02;
 Wed,  1 Jan 2020 16:15:11 +0000 (UTC)
Date: Wed, 1 Jan 2020 11:15:11 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: =?utf-8?B?5peg5YWE5byf5LiN56+u55CD?= <695331215@qq.com>
Message-ID: <558596810.144158.1577895311750.JavaMail.zimbra@redhat.com>
In-Reply-To: <tencent_89CAA885596D056C7E2299802BF6D3E62B08@qq.com>
References: <tencent_89CAA885596D056C7E2299802BF6D3E62B08@qq.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.30, 10.4.195.13]
Thread-Topic: ./runltp always stop in restarting syslog daemon
Thread-Index: BbUXmekCAg8L9V2L8byr0S232x089A==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: UjGJAEmuMP2DMdKFz0qxlg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] ./runltp always stop in restarting syslog daemon
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
Cc: ltp <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> Hi,
> I use ltp-full-20190930.tar.bz2 run in Ubuntu 16.04.6 LTS , the kernel
> version is 4.4.0-170-generic. My linux is using Vagrant in macOs.
> It always stop in [syslog01 0 TINFO : restarting syslog daemon].

There was a polkit bug that manifisted in this way. Have a look
if you're not running into same issue as described here:
  https://bugzilla.redhat.com/show_bug.cgi?id=1711536
  https://bugzilla.redhat.com/show_bug.cgi?id=1724444


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
