Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FF41E7A11
	for <lists+linux-ltp@lfdr.de>; Fri, 29 May 2020 12:08:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A17773C3189
	for <lists+linux-ltp@lfdr.de>; Fri, 29 May 2020 12:08:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 7737E3C3173
 for <ltp@lists.linux.it>; Fri, 29 May 2020 12:08:34 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 61918140B58D
 for <ltp@lists.linux.it>; Fri, 29 May 2020 12:08:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590746911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5sVVqbMlFIwx21FJZcjGuj6ORir6D1tFCeu1sQb4vB0=;
 b=Dx7gHWO4Vjhc7b5egxiBR/t/WrGBewOr7ukNOgigr77Ii4u+1Fk9WlljPKDhL8zssQhb+1
 L7OOhi2FtIYjYZ2RvK/ihntkxv4ZFlqPI7gU5uQiw0J+yeSOwp7WrLIELEOmiu7QSD1oOp
 tK6ZeiITN+45g+vVFRWlfwn5TczWaZc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-iczWaupdOBywiqUgx2BMPA-1; Fri, 29 May 2020 06:08:27 -0400
X-MC-Unique: iczWaupdOBywiqUgx2BMPA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4374460;
 Fri, 29 May 2020 10:08:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2174C60C05;
 Fri, 29 May 2020 10:08:26 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id DDA8A1809543;
 Fri, 29 May 2020 10:08:25 +0000 (UTC)
Date: Fri, 29 May 2020 06:08:25 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1709395031.14049839.1590746905611.JavaMail.zimbra@redhat.com>
In-Reply-To: <1590730943-23463-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1590730943-23463-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.12]
Thread-Topic: Use INTERNAL_LIB for ltp lib
Thread-Index: hroFKxk4GqzBEr3Ud32XPO9LB3Gvpw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] LIB: Use INTERNAL_LIB for ltp lib
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
> Use INTERNAL_LIB for ltp lib because installing these ltp static
> library in any situation is meaningless.
> 
> all static library as below:
> ./libs/libltpuinput/libltpuinput.a
> ./libs/libltpnewipc/libltpnewipc.a
> ./libs/libltpnuma/libltpnuma.a
> ./libs/libltpipc/libltpipc.a
> ./libs/libltpipc/libltpmsgctl.a
> ./utils/sctp/lib/libsctp.a
> ./utils/sctp/testlib/libsctputil.a
> ./lib/libltp.a
> ./testcases/network/rpc/basic_tests/rpc01/lib/librpc01.a
> ./testcases/network/rpc/rpc-tirpc/tests_pack/lib/librpc-tirpc.a
> ./testcases/kernel/containers/libclone/libclone.a
> ./testcases/kernel/mem/hugetlb/lib/libhugetlb.a
> ./testcases/kernel/mem/lib/libmem.a
> ./testcases/kernel/controllers/libcontrollers/libcontrollers.a
> ./testcases/kernel/controllers/cpuset/cpuset_lib/libcpu_set.a
> ./testcases/kernel/lib/libkerntest.a
> ./testcases/commands/nm/datafiles/lib.a

With the one above omitted from commit message:

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
