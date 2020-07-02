Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D13D52124DC
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 15:36:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7B78C3C210F
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 15:36:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 57BB63C074B
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 15:36:52 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 9AB5E10011DA
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 15:36:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593697010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xtNhcfWEtJk7PWhQe88b/XesTRXT6epsfBYHSEJOP5M=;
 b=BcXTZtI7rieEphWtaSkykAH6nw2ORTOhyCQEZITHJX+yQqJBf2oRd/Y88C+uFlCU+6UIJA
 uVGrXUu0Lx4/0yYypSeP8CJonScDhX8rpUfz/uiJ7XSzGbl+1jvPXzrPPaC4m3d9UcYd5n
 WxJsG/UVaKktpoA2/1gmM6OR/BQ7zMM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-AcUhO-b7MraFnuNeimj0-Q-1; Thu, 02 Jul 2020 09:36:48 -0400
X-MC-Unique: AcUhO-b7MraFnuNeimj0-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6C69107ACCA;
 Thu,  2 Jul 2020 13:36:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFFAA17D75;
 Thu,  2 Jul 2020 13:36:47 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id C97B86C9C4;
 Thu,  2 Jul 2020 13:36:47 +0000 (UTC)
Date: Thu, 2 Jul 2020 09:36:47 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <2038032878.605275.1593697007714.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200702100151.11780-2-mdoucha@suse.cz>
References: <20200702100151.11780-1-mdoucha@suse.cz>
 <20200702100151.11780-2-mdoucha@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.40.193.82, 10.4.195.10]
Thread-Topic: Add test for CVE 2017-1000405
Thread-Index: RPZGoMw3tbpsEg5HW4sGRgjFqkAwWw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/2] Add test for CVE 2017-1000405
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
> Fixes #316
> 
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
> 
> Changes since v1:
> - include lapi/mmap.h
> - TCONF if madvise(MADV_HUGEPAGE) fails with EINVAL

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
