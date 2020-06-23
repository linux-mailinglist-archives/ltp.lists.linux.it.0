Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF5E2055DC
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jun 2020 17:27:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D6343C22DE
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jun 2020 17:27:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 31F0E3C074B
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 17:27:46 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 96B8C200B76
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 17:27:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592926064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UKq0yzlEIZFH/wk+n9cQ/fkClDCuD9t/b0rJ36m214U=;
 b=gE5vI7m+kg4N7YQyhD1OwZ07J6UQ1g2gb+B5u1o3J5uJ/mStzwp1ARf3cosQp3dGE0+r0/
 Q7zoTx+xlIt1V7pzQARpNW0dftYrz8XWUQG5SQumKN0W6yST/cBIkG1D7KzpWfP0EHY/5U
 MvzqoQ5At9N26y58xWyZypGY4OWJ9aY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-32wtk90WO8SmZoTIWiOB8Q-1; Tue, 23 Jun 2020 11:27:40 -0400
X-MC-Unique: 32wtk90WO8SmZoTIWiOB8Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 165ABEC1A0;
 Tue, 23 Jun 2020 15:27:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0855919932;
 Tue, 23 Jun 2020 15:27:38 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43FBE1809547;
 Tue, 23 Jun 2020 15:27:38 +0000 (UTC)
Date: Tue, 23 Jun 2020 11:27:38 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>, pvorel <pvorel@suse.com>
Message-ID: <1299376782.18061133.1592926058183.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200623151948.GB16048@yuki.lan>
References: <20200617151135.GA7370@yuki.lan>
 <fbfc0935275f40efd2ac70685724e31806ed156e.1592465232.git.jstancek@redhat.com>
 <20200623151948.GB16048@yuki.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.2]
Thread-Topic: syscalls/setns: convert to new API
Thread-Index: EdOmqRjwEwKWLPtAnWwyWazcbhaJQQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/setns: convert to new API
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> Hi!
> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

Thanks Cyril, Petr. Pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
