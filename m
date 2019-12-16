Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 112C1120652
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Dec 2019 13:53:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE4173C2215
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Dec 2019 13:53:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id B751C3C17C7
 for <ltp@lists.linux.it>; Mon, 16 Dec 2019 13:53:45 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 09C64600C58
 for <ltp@lists.linux.it>; Mon, 16 Dec 2019 13:53:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576500823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NrBuiR/qn5HWhH+6n4pNQ1ZmAnkkrewZq9AaR/kBO84=;
 b=LrYHiWdp9nTPnFcmtZF1q8HgSaoPPwI80piORgu5aKVSl6hgKXhIKtEhrZ0U+ShkZPQ+gz
 bobrL3eyCErMqLUQMiu08grOJaFeCFCJjlg6JEPbuLMzqhyRX0j6wtV5DRzDnys59yOwGn
 VDcbkACjw2ngGvCYsrUVg7SGsi0Ebd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-o-qBiPLyPcSedVp9jrlfuA-1; Mon, 16 Dec 2019 07:53:39 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD0A21005502;
 Mon, 16 Dec 2019 12:53:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C42A76046C;
 Mon, 16 Dec 2019 12:53:38 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB44A18095FF;
 Mon, 16 Dec 2019 12:53:38 +0000 (UTC)
Date: Mon, 16 Dec 2019 07:53:38 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1162711495.16999993.1576500818740.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191213150812.GA13143@rei.lan>
References: <ebbe6cc68c39a619b6ea4a1e217c52c5d3e8b525.1576067278.git.jstancek@redhat.com>
 <20191213150812.GA13143@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.6]
Thread-Topic: futex_cmp_requeue01: cope with spurious wakeups
Thread-Index: BBKdws5gv7DXsWvg1caERD0u/Mqzhw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: o-qBiPLyPcSedVp9jrlfuA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] futex_cmp_requeue01: cope with spurious wakeups
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

Pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
