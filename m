Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6EF158EA0
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Feb 2020 13:39:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3CED83C2387
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Feb 2020 13:39:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 998293C224B
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 13:39:36 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 281A91A014B6
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 13:39:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581424774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pHc3MybdJJisrIK/srZDoILam0hgetxsaAIW2EupYQE=;
 b=itTwiGAovQp7c1mhQ7Xbh6zPCiEfP66ZyD7yO0zPko40wcfQAIlO9pEQcgG6p8mXrLHjLf
 fLjshjJGYtUNnesl1MQTad+BnUNNGSpGZ0An3pf5yxpgoZ7vjt7qevzn6xWn9Zv1i6kMZD
 +CEAt6+Zfz5HLwbWMH0TqpeJRjyc044=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-xVV8U9PbMrqYBTbs2JgDsQ-1; Tue, 11 Feb 2020 07:39:30 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB7421005510;
 Tue, 11 Feb 2020 12:39:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3C9E5C100;
 Tue, 11 Feb 2020 12:39:29 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id D32EB18089C8;
 Tue, 11 Feb 2020 12:39:29 +0000 (UTC)
Date: Tue, 11 Feb 2020 07:39:29 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>, ice_yangxiao@163.com, 
 Rachel Sibley <rasibley@redhat.com>
Message-ID: <2059929054.7019965.1581424769808.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2e-w=-wp6tpG2+nz1wy35XBP5eDpdXNMV_FN-hWLc8iBA@mail.gmail.com>
References: <87e6761eb699c7912e2064dea222f5ac7fd04a6b.1581338640.git.jstancek@redhat.com>
 <CAEemH2f90MPBV_w2+gw331cg0Fiu-=aqgp3M1BHhBCXcFUbyyg@mail.gmail.com>
 <1734212650.7000036.1581418326024.JavaMail.zimbra@redhat.com>
 <CAEemH2cJhxWcMj3k1ayasQegL-aPgjkkdypk881dXmjeV=MQmA@mail.gmail.com>
 <333995219.7015340.1581423014012.JavaMail.zimbra@redhat.com>
 <CAEemH2e-w=-wp6tpG2+nz1wy35XBP5eDpdXNMV_FN-hWLc8iBA@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.21]
Thread-Topic: syscalls/setrlimit06: lower RLIMIT_CPU parameters
Thread-Index: JKKT511sVMjTWOEE56MM6djnPVufGg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: xVV8U9PbMrqYBTbs2JgDsQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/setrlimit06: lower RLIMIT_CPU parameters
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
> Ok sure. Let's apply the original first, then keep watching the status in
> the next testing.

Pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
