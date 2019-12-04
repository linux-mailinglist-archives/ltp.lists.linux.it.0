Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDE8112DAA
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Dec 2019 15:43:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F4A03C24AF
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Dec 2019 15:43:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id AA2913C2466
 for <ltp@lists.linux.it>; Wed,  4 Dec 2019 15:43:13 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 14C6260E455
 for <ltp@lists.linux.it>; Wed,  4 Dec 2019 15:43:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575470591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g3VYZu2Msuo/GrqTGe5D8EVEkLes+Ylvr+P670WnJo0=;
 b=ihXshv61MwG44IeqyhM2qG/ngeQUzEmK1sNIQHwNFuyrg/6/ZYFCEKM6e4ddVDc1OFJzoR
 iXD9nniz7DPB5GuTvzU7SB9xXNPKhlciktbxISVWZI9xoG5XEgwLpVOEoVeCPF2VsmJlxp
 B0B1Yw/8plEetpj8SWyoYdQTEOGUe0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-JNulPZWVPeum3MOUKv5umw-1; Wed, 04 Dec 2019 09:43:09 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB77818543A6;
 Wed,  4 Dec 2019 14:43:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 869F65D6AE;
 Wed,  4 Dec 2019 14:43:07 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id E20315BC09;
 Wed,  4 Dec 2019 14:43:04 +0000 (UTC)
Date: Wed, 4 Dec 2019 09:43:04 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <385099805.15030947.1575470584839.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191203190925.GA5150@infradead.org>
References: <cki.6C6A189643.3T2ZUWEMOI@redhat.com>
 <1738119916.14437244.1575151003345.JavaMail.zimbra@redhat.com>
 <8736e3ffen.fsf@mpe.ellerman.id.au>
 <1420623640.14527843.1575289859701.JavaMail.zimbra@redhat.com>
 <1766807082.14812757.1575377439007.JavaMail.zimbra@redhat.com>
 <20191203190925.GA5150@infradead.org>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.3]
Thread-Topic: userspace hitting sporadic SIGBUS on xfs (Power9, ppc64le),
 v4.19 and later
Thread-Index: bZFnIYc4/9CmmxXsANYOsGnjcI2iPQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: JNulPZWVPeum3MOUKv5umw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [bug] userspace hitting sporadic SIGBUS on xfs (Power9,
 ppc64le), v4.19 and later
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
Cc: darrick wong <darrick.wong@oracle.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Memory Management <mm-qe@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>, linux-xfs@vger.kernel.org,
 CKI Project <cki-project@redhat.com>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> Please try the patch below:

I ran reproducer for 18 hours on 2 systems were it previously reproduced,
there were no crashes / SIGBUS.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
