Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB4223A3F4
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Aug 2020 14:18:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 012993C67AD
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Aug 2020 14:18:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 5CC483C677C
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 14:18:31 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id D7CC310009E6
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 14:18:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596457109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yp+6IvmfkJLq0vw/bDQrRkwBOeDsZaKu4i7gyZaPeYY=;
 b=RNkRpKq0w6YXA2c1/OoUhhgij4mqEQe/C2VgD3J5jaXLqw/LNsA66IpeJZIZDU8I1E2VG7
 kKuJp+ksmf40qn0+KbW6QgiNxU1et1tnUDxPuwjCWjkEYb3V//DpV8fOdygmdb+sWrLdHT
 NkfewV3NtyM5qDIG5n69Iu46/J+WvB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-mgdDRM8vOwiYSE6W0iD38A-1; Mon, 03 Aug 2020 08:18:23 -0400
X-MC-Unique: mgdDRM8vOwiYSE6W0iD38A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA293805721;
 Mon,  3 Aug 2020 12:18:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D5195D9F7;
 Mon,  3 Aug 2020 12:18:22 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E7F21809547;
 Mon,  3 Aug 2020 12:18:22 +0000 (UTC)
Date: Mon, 3 Aug 2020 08:18:22 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: broonie@kernel.org, skhan@linuxfoundation.org
Message-ID: <1881588710.5797015.1596457102422.JavaMail.zimbra@redhat.com>
In-Reply-To: <9927ed18c642db002e43afe5e36fb9c18c4f9495.1594811090.git.jstancek@redhat.com>
References: <9927ed18c642db002e43afe5e36fb9c18c4f9495.1594811090.git.jstancek@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.12, 10.4.195.12]
Thread-Topic: selftests: vdso: hash entry size on alpha,s390x is 8 bytes
Thread-Index: mzWLwxoVgxh0LzlPvmyKz4MhjG4FnQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] selftests: vdso: hash entry size on alpha,
 s390x is 8 bytes
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
Cc: linux-kernel@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> parse_vdso.c is crashing on 5.8-rc5 s390x, because it wrongly reads
> nbucket as 0:
>   Program received signal SIGFPE, Arithmetic exception.
>   0x0000000001000f3e in vdso_sym (version=0x1001280 "LINUX_2.6",
>   name=0x100128a "__vdso_getcpu") at parse_vdso.c:207
>   207             ELF(Word) chain = vdso_info.bucket[elf_hash(name) %
>   vdso_info.nbucket];
>   (gdb) p vdso_info.nbucket
>   $1 = 0
> 
> Per readelf source:
>   https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=binutils/readelf.c;h=2406304fe35a832ac53aa7b1a367f3f7afed4264;hb=HEAD#l10027
> and objdump output hash entries are double size on 64bit s390 and alpha:
>   0000000000000120 <.hash>:
>    120:   00 00 00 00             .long   0x00000000
>    124:   00 00 00 03             .long   0x00000003
>    128:   00 00 00 00             .long   0x00000000
>    12c:   00 00 00 07             .long   0x00000007
>    130:   00 00 00 00             .long   0x00000000
>    134:   00 00 00 01             .long   0x00000001
>    138:   00 00 00 00             .long   0x00000000
>    13c:   00 00 00 05             .long   0x00000005
>    140:   00 00 00 00             .long   0x00000000
>    144:   00 00 00 06             .long   0x00000006
> 	  ...
>    16c:   00 00 00 02             .long   0x00000002
>    170:   00 00 00 00             .long   0x00000000
>    174:   00 00 00 03             .long   0x00000003
>    178:   00 00 00 00             .long   0x00000000
>    17c:   00 00 00 04             .long   0x00000004
> 
> Do similar check in parse_vdso.c and treat hash entries as double word.

Ping, any thoughts about the issue or patch?


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
