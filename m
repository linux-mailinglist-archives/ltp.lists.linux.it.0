Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B5A12E4B0
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jan 2020 11:01:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 811133C248B
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jan 2020 11:01:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 4D0E93C224E
 for <ltp@lists.linux.it>; Thu,  2 Jan 2020 11:01:34 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 1DF5D1401B35
 for <ltp@lists.linux.it>; Thu,  2 Jan 2020 11:01:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577959292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IrQOXm4xchHi8DOwsTCW5UI/DygtamKfzVGTA6GthVo=;
 b=XuFxroQ1RxiS3oSk14/7Vhuo1lXPSELtOB3/se2uFODYoGsF2UrD+giCXQMs+48V56WJUa
 emsYEs0mw2NX3SUagy5AOpDJsoZVRfiHL90KFZ3S0/mLNURiTa0QQJlbzTC39s7cd3esJA
 LGbeBHKRTOZU5EZC5mrm+47D3NifwhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-1E8T4jhDOG2CuIeCv3KfZQ-1; Thu, 02 Jan 2020 05:01:28 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAE23801E7E;
 Thu,  2 Jan 2020 10:01:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F4805C3FA;
 Thu,  2 Jan 2020 10:01:26 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3FE6E81E07;
 Thu,  2 Jan 2020 10:01:26 +0000 (UTC)
Date: Thu, 2 Jan 2020 05:01:26 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <1771713636.197122.1577959286001.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191218131533.15323-1-mdoucha@suse.cz>
References: <461386048.17251961.1576663655809.JavaMail.zimbra@redhat.com>
 <20191218131533.15323-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.176, 10.4.195.19]
Thread-Topic: Use real FS block size in fallocate05
Thread-Index: GWdF4NQdMPDd5D2ruoiIhQDozjYOFg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 1E8T4jhDOG2CuIeCv3KfZQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] Use real FS block size in fallocate05
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
> fallocate() behavior depends on whether the file range is aligned to full
> blocks. Make sure that the test always uses aligned file range so that
> the test is consistent across platforms.
> 
> Also use the TEST() macro to prevent errno pollution and increase test device
> size to avoid weird edge cases that don't happen in the real world.
> 
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
