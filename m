Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 494EF298ED5
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 15:05:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE07D3C562B
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 15:05:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id A5D073C26DD
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 15:05:01 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1B5801A00982
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 15:04:59 +0100 (CET)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09QE2Xx7001390; Mon, 26 Oct 2020 10:04:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : date : message-id : mime-version : content-type; s=pp1;
 bh=eqOemuP1si787N9jCRBe4VFZcApoY08PxWvr5b/00og=;
 b=mgOvKItWmTtyMrZ8pve7eqjPlsw7B6rluICX9kTG09AfRHw2f3a3kQFZaed+is/rw3/a
 pmW7YI0jnWgVOKnqtpNODtLF86T6VAXqIakWJ6bdiIqb5tbriebjYa3jHKVFvvEXRXLO
 dtUfBNmESiVV/CEoZCJotV38j9oCixFrbvoSvXQ00Fhn44RfTnKpY3ZkSq3SNK1borbQ
 phcu4fxilOlg7wp8iYY6aYFc/N0hIJ0La0VZVGDeb7s1PPs8AxMMci5JMd4v9UGfY259
 CBfPw4548v6SkygWluZ1Nx1r22lpGQJj5EzPdxx3x41Our4/cEJT6u1SQTQRSYAPTRKN WQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34dcqdfk83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Oct 2020 10:04:55 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09QDwAcc013459;
 Mon, 26 Oct 2020 14:04:52 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 34cbw7t99m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Oct 2020 14:04:52 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 09QE4one33489250
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Oct 2020 14:04:50 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79FB35204E;
 Mon, 26 Oct 2020 14:04:50 +0000 (GMT)
Received: from oc8242746057.ibm.com (unknown [9.171.18.6])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 0520F52057;
 Mon, 26 Oct 2020 14:04:49 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: chrubis@suse.cz
In-Reply-To: 20201006085309.32227-1-cascardo@canonical.com
Date: Mon, 26 Oct 2020 15:04:48 +0100
Message-ID: <87v9exf5hb.fsf@oc8242746057.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-26_06:2020-10-26,
 2020-10-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 phishscore=0 suspectscore=3 mlxlogscore=551 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2010260102
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
Cc: kelsey.skunberg@canonical.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


Hi all,

the patch from Chris fixes the below issue on s390x:

timer_settime01.c:96: TINFO: Testing for using absolute time:
timer_settime01.c:169: TPASS: timer_settime(CLOCK_REALTIME) passed
timer_settime01.c:169: TPASS: timer_settime(CLOCK_MONOTONIC) passed
timer_settime01.c:169: TPASS: timer_settime(CLOCK_PROCESS_CPUTIME_ID) passed
timer_settime01.c:169: TPASS: timer_settime(CLOCK_THREAD_CPUTIME_ID) passed
timer_settime01.c:169: TPASS: timer_settime(CLOCK_BOOTTIME) passed
timer_settime01.c:111: TCONF: CLOCK_BOOTTIME_ALARM unsupported: EOPNOTSUPP (95)
timer_settime01.c:111: TCONF: CLOCK_REALTIME_ALARM unsupported: EOPNOTSUPP (95)
timer_settime01.c:156: TFAIL: timer_gettime(CLOCK_TAI) reported bad values (0: 50000019): SUCCESS (0)
timer_settime01.c:169: TPASS: timer_settime(CLOCK_TAI) passed

and

timer_settime01.c:96: TINFO: Testing for using absolute time:
timer_settime01.c:169: TPASS: timer_settime(CLOCK_REALTIME) passed
timer_settime01.c:169: TPASS: timer_settime(CLOCK_MONOTONIC) passed
timer_settime01.c:169: TPASS: timer_settime(CLOCK_PROCESS_CPUTIME_ID) passed
timer_settime01.c:169: TPASS: timer_settime(CLOCK_THREAD_CPUTIME_ID) passed
timer_settime01.c:156: TFAIL: timer_gettime(CLOCK_BOOTTIME) reported bad values (0: 50000097): SUCCESS (0)
timer_settime01.c:169: TPASS: timer_settime(CLOCK_BOOTTIME) passed
timer_settime01.c:111: TCONF: CLOCK_BOOTTIME_ALARM unsupported: EOPNOTSUPP (95)
timer_settime01.c:111: TCONF: CLOCK_REALTIME_ALARM unsupported: EOPNOTSUPP (95)
timer_settime01.c:169: TPASS: timer_settime(CLOCK_TAI) passed



Regards
Alex

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
