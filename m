Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5412C577D
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 15:53:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 95B303C59E8
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 15:53:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 687BA3C4E1D
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 15:53:00 +0100 (CET)
Received: from mail.avm.de (mail.avm.de [212.42.244.94])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D7460600CE8
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 15:52:59 +0100 (CET)
Received: from mail-notes.avm.de (mail-notes.avm.de [172.16.0.1])
 by mail.avm.de (Postfix) with ESMTP
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 15:52:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
 t=1606402348; bh=cJVK991dekM2/P+eCaNZYux2lNjx6WsteXRsWWQ1PSM=;
 h=In-Reply-To:References:Subject:From:To:Date:From;
 b=bkgk1D7erVkGHbTHAe9hy1YzxlCEJOsjXr2ajPl62pMxkWk75g0Cu+uFGOQd0ZXNg
 ga9bCPkvlCNyoUtWoHJ/VOftl/iUhU2fPZICbgRa4NHJA57YpG2XR1e2GSwL3dxOJl
 ClXM5myj3a7gQZegcrR5e40dfWZ1JREuJj/Aabug=
X-Disclaimed: 1
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
In-Reply-To: <edf96c93-8f16-6545-629a-be727d4c8eb2@oracle.com>
References: <edf96c93-8f16-6545-629a-be727d4c8eb2@oracle.com>,
 <OFCE604BCE.4F62924B-ONC125862B.004801C0-C125862B.0048027B@avm.de>
To: "LTP List" <ltp@lists.linux.it>
Date: Thu, 26 Nov 2020 15:52:28 +0100
Message-ID: <OF47EE0279.8BED1D35-ONC125862C.0051B56D-C125862C.0051B570@avm.de>
X-Mailer: Lotus Domino Web Server Release 11.0.1FP1 July 20, 2020
X-MIMETrack: Serialize by http on ANIS1/AVM(Release 11.0.1FP1|July 20, 2020) at
 26.11.2020 15:52:28, Serialize complete at 26.11.2020 15:52:28,
 Serialize by Router on ANIS1/AVM(Release 11.0.1FP1|July 20, 2020) at
 26.11.2020 15:52:28
X-purgate-ID: 149429::1606402348-000005C2-C4BD581B/0/0
X-purgate-type: clean
X-purgate-size: 965
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] netstress: explicitly set a thread stack size
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
From: Johannes Nixdorf via ltp <ltp@lists.linux.it>
Reply-To: j.nixdorf@avm.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alexey,

On Thu, Nov 26, 2020 at 05:05:14PM +0300, Alexey Kodanev wrote:
> > +		tst_brk(TBROK | TERRNO, "pthread_attr_init failed");
> > +
> > +	errno = pthread_attr_setstacksize(&attr, 128*1024 + 2*max_msg_len);
> 
> Since max_msg_len is 65535, the result won't be even 4 bytes aligned,
> perhaps using just 256 * 1024?

The function pthread_attr_setstacksize does not have any alignment
requirements specified and only sets the minimum stack size. This means
the libc is required to over-allocate and suitably align the stack to
match platform requirements. Is this broken on any libraries the LTP
project cares about?

Note that this is different from pthread_attr_setstack, as there the
memory region is provided by the caller and the libc can't change the
alignment later on.

I'm reluctant to use a static value here as max_msg_len may be modified
by command line arguments.

Regards,
Johannes

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
