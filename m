Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5FC17F155
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 08:59:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 65E263C6049
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 08:59:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 2A9A73C6000
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 08:58:58 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id B25421001744
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 08:58:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583827135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GvdwdmFoveOmXx6N2YNTgQ9BaySVLSe+YS3FnsZUDO8=;
 b=Ju0eetTUdo2THH7D+0OdOGFmzKYDPj/yB2Gb2MSQhAAaq7BGHi3pXFY5l5csEtcayYjuf6
 v5Iw7DOJzqTskXY/vwSkI/pc61XDfCldT1McGjPsqnKp5kn2af1F59JxFDBylbNPKYzAg6
 BM4fGejOOaOUiMzL/obG7cU0zOYrOZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-kzrpJ8wVP72Xwfw4JdSvWQ-1; Tue, 10 Mar 2020 03:58:49 -0400
X-MC-Unique: kzrpJ8wVP72Xwfw4JdSvWQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABBBCA0CBF;
 Tue, 10 Mar 2020 07:58:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A261060C05;
 Tue, 10 Mar 2020 07:58:48 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B44F18095FF;
 Tue, 10 Mar 2020 07:58:48 +0000 (UTC)
Date: Tue, 10 Mar 2020 03:58:48 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Ondrej Mosnacek <omosnace@redhat.com>, Sasha Levin <sashal@kernel.org>
Message-ID: <1743314452.221557.1583827128244.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAFqZXNugDTJ8MQePK1Cyz2TOJiPcPrq3ohmNZngJjaTCq1Y6mQ@mail.gmail.com>
References: <cki.411617A928.D7E40QQCW6@redhat.com>
 <20200309215305.GV21491@sasha-vm>
 <CAFqZXNugDTJ8MQePK1Cyz2TOJiPcPrq3ohmNZngJjaTCq1Y6mQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.28]
Thread-Topic: =?utf-8?Q?=E2=9D=8C_PANICKED=3A?= Test report for kernel
 5.5.8-c30f33b.cki (stable-queue)
Thread-Index: SiOoaWByeX9gaTy7dD3aEMxB2reMOQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_PANICKED=3A_Test_report_for_kernel_5?=
 =?utf-8?q?=2E5=2E8-c30f33b=2Ecki_=28stable-queue=29?=
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
Cc: Memory Management <mm-qe@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>,
 CKI Project <cki-project@redhat.com>, Ondrej Moris <omoris@redhat.com>,
 LTP Mailing List <ltp@lists.linux.it>,
 William Gomeringer <wgomeringer@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> > Following the link above I got to
> > https://cki-artifacts.s3.us-east-2.amazonaws.com/index.html?prefix=datawarehouse/2020/03/09/480158/audit__audit_testsuite_test/,
> > but it shows that all tests are passing? The console log looks fine too:
> > https://cki-artifacts.s3.us-east-2.amazonaws.com/datawarehouse/2020/03/09/480158/x86_64_5_console.log.
> > Where's the panic?
> 
> The panic happened during the LTP test on s390x (note the lightning
> symbols under s390x, Host 1). The backtrace is at the end of
> https://cki-artifacts.s3.us-east-2.amazonaws.com/datawarehouse/2020/03/09/480158/s390x_1_console.log

Which looks like same panic reported for last couple days. See:
  https://lore.kernel.org/stable/976629603.10711789.1583698043547.JavaMail.zimbra@redhat.com/
  https://lore.kernel.org/lkml/20200224030007.3990-1-cai@lca.pw/


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
