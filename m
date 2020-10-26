Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C90F299087
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 16:08:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EB7FF3C561C
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 16:08:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 803783C2507
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 16:08:03 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CFE511A003CA
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 16:08:02 +0100 (CET)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09QF4hqn084561; Mon, 26 Oct 2020 11:07:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : cc :
 subject : in-reply-to : in-reply-to : references : date : message-id :
 mime-version : content-type; s=pp1;
 bh=LCjPpavbsl3XjyQrfetmleLQDH5WazM4DweeIGRNqA0=;
 b=JXUfP13B+KuiaoStt3DCZqQKLZ1L76uyOsJ4yVvEDuYLzcP9C8yotIzJTzRmtqTk1txR
 rbiqyiOHK1tgBScG2utZMOBTETu6Fi7StHl9wErrZsHLlf9P0Rb4GgyKJzz/jT6jZa7M
 FFU7NsumcU0Eos0RHPcKOmwEZBmz/CVZ046nujQC7srEKgdPEGwLZx85FHUgytyHlci5
 QjtzVJrJ6uv9Tc/RFVaw3lAVUfmnZQ5qgx6rLiJ0QAsIZcbYLGqYvImdnQY/XD8xlJt0
 YmxNF3YMtAeMCs3XaoE55gp17vnrOhbG166lyAo0ELvqhc2bIiZayq7cBB0M8os7VmbL rw== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34dduha0sr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Oct 2020 11:07:58 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09QF5qaT023037;
 Mon, 26 Oct 2020 15:07:56 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 34cbw816p7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Oct 2020 15:07:55 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09QF7rim33358208
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Oct 2020 15:07:53 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC54F4C04A;
 Mon, 26 Oct 2020 15:07:53 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA0584C040;
 Mon, 26 Oct 2020 15:07:52 +0000 (GMT)
Received: from oc8242746057.ibm.com (unknown [9.171.18.6])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 26 Oct 2020 15:07:52 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: Cyril Hrubis <chrubis@suse.cz>
In-Reply-To: <20201026143424.GA31934@yuki.lan>
In-Reply-To: 
References: <87v9exf5hb.fsf@oc8242746057.ibm.com>
 <20201026143424.GA31934@yuki.lan>
Date: Mon, 26 Oct 2020 16:07:52 +0100
Message-ID: <87sga1f2k7.fsf@oc8242746057.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-26_08:2020-10-26,
 2020-10-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 mlxlogscore=752
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010260107
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] syscalls/timer_settime01: adjust for rounding from nsec
 to usec
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
Cc: , kelsey.skunberg@canonical.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>> the patch from Chris fixes the below issue on s390x:
>
> And what about the simpler solution I've proposed in the reply, does
> that one work fine as well?

Hi Cyril,

first, sorry for butchering your name :/

Second, I tested now both patches on a heavy loaded system (with
stress-ng) and both seem to solve my issues. I ran a test 1000 times
(-i 1000) and couldn't reproduce it anymore.

Regards
Alex

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
