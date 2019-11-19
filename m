Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4880B102186
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Nov 2019 11:02:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D998A3C22A9
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Nov 2019 11:02:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id F092F3C220E
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 11:02:40 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 7CCAE10028AE
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 11:02:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574157759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NGV1W5fwy4q1q7E2ouPhoSXiBkB+RHlzD0E27eGlWv8=;
 b=Txhmw/exAkcFsJGqD8A3NwByJiD3Ain+TBZM71ciW1GBehTQ2nYz2UpmKagXE+kHmSXuev
 ZSAJ0Tgxpu5ICk5fMgBcbC127f3mic7F6/w/NbhUaba8yrLK5/NOyBklmjRg99ojQ8/1Cr
 0yZDm7BLlqwGjitH0UUois5g0Q9ajnw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-yoPIVZPCPPSNLJNTORFxDQ-1; Tue, 19 Nov 2019 05:02:36 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DBDC593A1;
 Tue, 19 Nov 2019 10:02:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00D396055C;
 Tue, 19 Nov 2019 10:02:34 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id E0DF14BB5B;
 Tue, 19 Nov 2019 10:02:34 +0000 (UTC)
Date: Tue, 19 Nov 2019 05:02:34 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <1061994684.12955452.1574157754643.JavaMail.zimbra@redhat.com>
In-Reply-To: <6371c082-ac3a-3daf-9196-481973f85b04@suse.cz>
References: <d8ad4bab26557fdf70e7ebc3f771bbb37ae889d7.1574093242.git.jstancek@redhat.com>
 <CAEemH2eu8HcQ90+BxUL0Hu+No6P5je4xC3oqVSU_ZnwMXEG=7Q@mail.gmail.com>
 <1824199572.12930798.1574151212869.JavaMail.zimbra@redhat.com>
 <6371c082-ac3a-3daf-9196-481973f85b04@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.103, 10.4.195.17]
Thread-Topic: fallocate05: increase FALLOCATE_SIZE
Thread-Index: tvMZJKVG8X0Q7FezBWm7pAx/DbVePQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: yoPIVZPCPPSNLJNTORFxDQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fallocate05: increase FALLOCATE_SIZE
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
> > ----- Original Message -----
> > fallocate05 seems to be the only test using it, but in general I think we
> > can do that too. Assuming this alone would be reliable, is there any
> > advantage of running test with small FALLOCATE_SIZE?
> 
> Note that simply increasing FALLOCATE_SIZE will not fix an incorrect
> pass when the file system wasn't completely full. Here's the code that
> checks whether some blocks were properly fallocate()d:
> 
> tst_fill_fs(MNTPOINT, 1);
> ret = write(fd, buf, sizeof(buf));
> if (ret < 0)
> 	tst_res(TFAIL | TERRNO, "write() failed unexpectedly");
> else
> 	tst_res(TPASS, "write() wrote %zu bytes", ret);
> 
> If the file system somehow finds a few free blocks after tst_fill_fs()
> returns, short write() will still count as a pass.

That is good point, but that seems like issue that existed even with
8k FALLOCATE_SIZE, right?


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
