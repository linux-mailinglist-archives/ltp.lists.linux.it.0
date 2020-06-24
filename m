Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A92AC20735D
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 14:33:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 43EAD3C2B9A
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 14:33:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 9F1D73C04FD
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 14:33:48 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 33C691000A16
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 14:33:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593002026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Izkpbv3+X7ioxXFKEXdiOhyzSjdX9qIiX6jOaZDvtko=;
 b=Pg/ikkUJ8fvzzNE3mEDGsRmSXTBILafcnk/WrUGfdyemUE5HPlY2I+zzkAex6hKw/wM3eT
 h/NTP4gM/XE3Sew8zw8+iJq/fw668aujTU50b4jBwOvMQN/O2X6kUIuSBHyvcn30P4fpPv
 rkyzKz3ncI8TH2ykU8Bgv7MFjvL/J7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-Dra73hguM4SKKZ28mm2rFA-1; Wed, 24 Jun 2020 08:33:44 -0400
X-MC-Unique: Dra73hguM4SKKZ28mm2rFA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67EE5800D5C;
 Wed, 24 Jun 2020 12:33:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 614D85DD61;
 Wed, 24 Jun 2020 12:33:42 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2ECBB104912;
 Wed, 24 Jun 2020 12:33:42 +0000 (UTC)
Date: Wed, 24 Jun 2020 08:33:41 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <2069023850.18523445.1593002021924.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200619162922.20465-2-mdoucha@suse.cz>
References: <20200619162922.20465-1-mdoucha@suse.cz>
 <20200619162922.20465-2-mdoucha@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.8]
Thread-Topic: Add test for CVE 2017-1000405
Thread-Index: VL+OOy5DZzVqoLMdIP3G5E8YPyW5Jg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Add test for CVE 2017-1000405
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
> +
> +#include <sys/mman.h>
> +
> +#include "tst_test.h"
> +#include "tst_fuzzy_sync.h"

We should also include lapi/mmap.h, and check MADV_HUGEPAGE support
at runtime, since older distros might not have it.

Other than that, it looks good to me.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
