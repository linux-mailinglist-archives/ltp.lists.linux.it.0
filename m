Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D77A014098E
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 13:15:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 887E83C2266
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 13:15:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id BD6CD3C20F6
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 13:15:43 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id F2FD0601955
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 13:15:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579263341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oIvSL3nVnNSSPvuVEZYlVNKYsCCXA9c8YiWpfaO+J3g=;
 b=Oz58Qin4PMwJz9+atDiRr89cOChFg7+jjQXKTG/Xwj7MH6UN+6AW1DxfaN/17laGUDziuR
 smgek9vKApC+TOgwh61oPSZbPJw2i0euTrlC3JmzLTIOkIFNS5jfDTNUCNTpcIXZdkf7p2
 eg2OhKvdlnocit/GuVM4KuL22KwpYiU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-3MiaCMw4MB2Lfa2srtUj8g-1; Fri, 17 Jan 2020 07:15:37 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C9A818AAFA1;
 Fri, 17 Jan 2020 12:15:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8250E9CA3;
 Fri, 17 Jan 2020 12:15:36 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7590918089C8;
 Fri, 17 Jan 2020 12:15:36 +0000 (UTC)
Date: Fri, 17 Jan 2020 07:15:36 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <961160207.2450954.1579263336279.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200117113715.22786-1-pvorel@suse.cz>
References: <20200117113715.22786-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.12]
Thread-Topic: Fixes for old distros
Thread-Index: DOGmnKH1p2D5YxYK+6X8sLXd6Mw/+g==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 3MiaCMw4MB2Lfa2srtUj8g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] Fixes for old distros
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
> Hi,
> 
> few fixes for old SLES we still support,
> which I'd like to merge before release.

Looks good to me.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
