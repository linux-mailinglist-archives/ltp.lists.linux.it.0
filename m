Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4A6AB617C
	for <lists+linux-ltp@lfdr.de>; Wed, 14 May 2025 06:29:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1747196975; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-type : content-transfer-encoding : sender : from;
 bh=iGZvmx19sGAWR+iwfehlH/6D58yyPNByaNknGXcHKSg=;
 b=b0eQzzbpbwgl2fBP28rzCwDhGT8HFaH7dtWA3Kw9kUv14QUOqrSvDLC/eOnWRctv64pi2
 t7Mb3cSRVvf1cWdinoSqyu1tRkmPw/1+9kvCeTCbsk8nusmRWUlgxC7afhjk8Qs7LOYssIV
 S3LHebE7j9gDZp/lOEvyrWUOEUnUD48=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5FCDC3CC33D
	for <lists+linux-ltp@lfdr.de>; Wed, 14 May 2025 06:29:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8CCD83CC326
 for <ltp@lists.linux.it>; Wed, 14 May 2025 06:28:47 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A31D96009F9
 for <ltp@lists.linux.it>; Wed, 14 May 2025 06:28:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747196920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/rd07gUtYEQ14++Iw79a/xhxJ4uHH5EWdb6zoG16cBg=;
 b=BoP6cd9bS4llPVBAKBD04aOjpFIMp3CxtHGsMsw5hHo1xSxTECc2767W/zTE06Mxb+frRk
 mPYMDwpaOzs25Zkd26np2d/FOuvqvJfbjcAx06QLZP283MFHptJwiq56zL2VC0fq9j96ul
 lO8RzQ9LCwLj2nYKO5oH6HyQdWcnmBs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-630-vDKcQTiHP4KMVqkthmrsOw-1; Wed,
 14 May 2025 00:28:27 -0400
X-MC-Unique: vDKcQTiHP4KMVqkthmrsOw-1
X-Mimecast-MFC-AGG-ID: vDKcQTiHP4KMVqkthmrsOw_1747196899
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8B20018004A7; Wed, 14 May 2025 04:28:19 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com
 (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AD7E319560A7; Wed, 14 May 2025 04:28:16 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed, 14 May 2025 12:28:10 +0800
Message-ID: <20250514042811.58339-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _-yND4DuHoKZUkdck2VCu5a4FBvKUbYtikjmhD31glA_1747196899
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [Patch v2 1/2] dirtyc0w_shmem: set child_needs_reinit
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
From: Li Wang via ltp <ltp@lists.linux.it>
Reply-To: Li Wang <liwang@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Li Wang <liwang@redhat.com>
---
 testcases/kernel/security/dirtyc0w_shmem/dirtyc0w_shmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/security/dirtyc0w_shmem/dirtyc0w_shmem.c b/testcases/kernel/security/dirtyc0w_shmem/dirtyc0w_shmem.c
index 64b187b35..2c7ad00f2 100644
--- a/testcases/kernel/security/dirtyc0w_shmem/dirtyc0w_shmem.c
+++ b/testcases/kernel/security/dirtyc0w_shmem/dirtyc0w_shmem.c
@@ -104,6 +104,7 @@ static void cleanup(void)
 
 static struct tst_test test = {
 	.needs_checkpoints = 1,
+	.child_needs_reinit =1,
 	.forks_child = 1,
 	.needs_root = 1,
 	.runtime = 120,
-- 
2.49.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
