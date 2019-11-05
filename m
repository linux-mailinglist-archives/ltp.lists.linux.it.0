Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C30EFE93
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 14:30:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 31D043C22C2
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 14:30:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 54DF13C2261
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 14:30:09 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id D96CE601C56
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 14:30:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572960607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=axRiSvBs8e/vHJ9BBRoIJTv7BxFulFimNQUCA3k3yis=;
 b=EHkJeZnXNrqoWCY4CXvh4LrJuZ6g6PgoYJCGSGiZLvzvFO+TtggKuioSh3Pxq094JDTP/o
 NYlHVHjmUNJmtlC7Ucozr9NlHMp1znAIMZLt7F4rw890Fau5Zn9THGmuZ7k2nOX+lqwXcb
 pXbDwuBrK7OC8Z10IguN6zhx3z+58c0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-m4JpJVmIMPeddQj9ih_d9A-1; Tue, 05 Nov 2019 08:29:58 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49C5F8017DE;
 Tue,  5 Nov 2019 13:29:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40F42600F6;
 Tue,  5 Nov 2019 13:29:57 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3826618005A9;
 Tue,  5 Nov 2019 13:29:57 +0000 (UTC)
Date: Tue, 5 Nov 2019 08:29:57 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <674546373.10539143.1572960597030.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191105131459.GA10912@rei.lan>
References: <4647b3bced96c66c040078a32c13dab65558816d.1572956488.git.jstancek@redhat.com>
 <20191105123849.GA8511@rei.lan>
 <937999891.10536811.1572959541272.JavaMail.zimbra@redhat.com>
 <20191105131459.GA10912@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.12]
Thread-Topic: read_all: move blacklist to source
Thread-Index: IeXfEPfzP+5Oc4Mf4I+6qKZlkPwf1A==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: m4JpJVmIMPeddQj9ih_d9A-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] read_all: move blacklist to source
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
> > OK to push both, or is this only for first patch?
> 
> Both of them, sorry for not being clear.

Thanks, both pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
