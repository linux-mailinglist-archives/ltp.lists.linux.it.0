Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 529451B7987
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 17:27:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E3123C290C
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 17:27:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 6629C3C2900
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 17:27:51 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 7E80E200C10
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 17:27:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587742068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n5L6JSuCw4flGqrRi6rRl0x0DuiQT5ecBzEQPZdGpnw=;
 b=ebPb6u8wn8MxI+1K88lkFs0QEnSQKcftjQr80janrYmwgL5wEXsnqPYkZ8iMnY0cNGwCmW
 CfHg6AMHzsm6dxmxONjKPMvTIyWtiXhWZSbZiRFBz9FOc5gUPNhepIEKMjwKqxBF+8CMbp
 dkkeTDADTuNHJxHjATIZ+arelxIgFas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-Aw_gV8TjMzamBXCEgI18OA-1; Fri, 24 Apr 2020 11:27:44 -0400
X-MC-Unique: Aw_gV8TjMzamBXCEgI18OA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E96631800D42
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 15:27:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E25645D716
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 15:27:43 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id ADEB718095FF
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 15:27:43 +0000 (UTC)
Date: Fri, 24 Apr 2020 11:27:43 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Message-ID: <1316682995.10143512.1587742063487.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200416122023.20952-1-mdoucha@suse.cz>
References: <20200416122023.20952-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.3]
Thread-Topic: Add test for CVE 2018-9568
Thread-Index: f0yijZ970xVKyQsD7zMi1ZNvArTkWg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Add test for CVE 2018-9568
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

fyi, some kernels may hit TBROK because commit b6f6118901d1
("ipv6: restrict IPV6_ADDRFORM operation") broke IPV6_ADDRFORM:
  https://lkml.org/lkml/2020/4/18/574


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
