Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E65A13758
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jan 2025 11:04:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1737021893; h=message-id :
 date : to : references : in-reply-to : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=OkKpY1TfWqTX5+YYjEekeWn4PZf3wTk43wR0IyJZkxg=;
 b=qCAMEdkicQ0yXopzO1IOvP0Jenk3QIUoRai4VJ+v+4AbXAub3cACNh/QO7YDejo0bZFTo
 kS+s+FJaJVeWcKIg5F8gyCWAW6AFHhJwO3OTsw28dMhFPrVY3iSMh1yWxV+ZhsDRFXR/UDV
 nEu03zMZpRFkOB64fNMx8OWcNkLz/LM=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 45EBC3C7BC6
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jan 2025 11:04:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3EE763C4CC3
 for <ltp@lists.linux.it>; Thu, 16 Jan 2025 11:04:50 +0100 (CET)
Authentication-Results: in-6.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=harshvardhan.j.jha@oracle.com;
 receiver=lists.linux.it)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 09C6114088D0
 for <ltp@lists.linux.it>; Thu, 16 Jan 2025 11:04:48 +0100 (CET)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50G9NLVm021814;
 Thu, 16 Jan 2025 10:04:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2023-11-20; bh=Xlons8V3gymNhApRrXN0d9dUCqgBEtOl1qWBOSi7Ou0=; b=
 avWjm40pytuQMLfkuaLzpH3Vuke9k1VCT6oHyx9ym8Q3oKe82jTBzZr6BfGY6fU7
 PyG/H9uW2m5O/dShCdEKlTalvrkeUluSPz9utktVeoAKL2GZKWL8gCI9QYGdqL//
 r4+I+Y6GpFn/IDGyJhgQhuRPshEj+MFP70yOHAWHsx0Jb3uEpFvdL3DviEOA8R2X
 EW/hn7bxz5RGMfXJr/VyFeHc3mh1lY/yFlmuEb6JOWN9qqycdNKS8f58oog+WMyw
 v+36Pjyc/59CL2AS7NYM4RpQeEwyyHPCTDeJ1hR/1dCzS8mn/cSQYJgImDVA/AGm
 uJyFQn/Y1eaVwWvqn5EuJA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443f7y9wq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jan 2025 10:04:47 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50G9adSY037202; Thu, 16 Jan 2025 10:04:45 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 443f3b5kwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jan 2025 10:04:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xDC1gEdAviTk1iQUnzwoVpyyygrF7Tp75iAf9GBHZqZxjC+FCZQV1t9xsaQR0jfZ63vOWhjVUiElYEnA0WVfen7kP+N3cuXdIJ2b5FoVCgzoeg+6GsYO5Y2+wbc73NbASwiBpla/Py5Qn++yInpgzgwa+Um/uyKa2R3lGyzQXItwfwtIPAvTbUWvPp/yfuDrU24WVAh17tPuIqm8WtmsVmPxH8NeHCxnaPjBDbDMWU3OZJ/nsw3An2TKLe5Gp1WwkFKlwMdN+Tb+sGmxNIQaWyAc2JTGahR1QHwa9CLdUOU/aEIN95qpQ01KWbWyxv880czblEi8ZZ2ksGW7uwvePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xlons8V3gymNhApRrXN0d9dUCqgBEtOl1qWBOSi7Ou0=;
 b=yuwohf7bjgLKgKexVwGtjn6+sk4kzNmiXrdGlSqeluwfPdxYwqebWORzLclMeLp1ujyz7naWgsgsUd/v04hdQdsGmX3P9RR1MvwsTSi1oUohYYRjDzRA3x7i1eK77sI6HbtNEIFvCalsPTm74sjO7py85p1sr7zg+KCO3Om7jPE2aRV0uVNcN++i7HOazV63xxtzq4lV/rCaoBvZvjfgQW1asAbOa9eT9A9ErZvTDkMER0QJqlGHW/P11JwSndvFwRZn/tx5rjuBfc9xEHt9IY7WQTzgHZMe3HsNlLfrzTg6SvKbGw0BlTAFop6w2ogE7ynrjP6QdhXvCjnMqnFeog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xlons8V3gymNhApRrXN0d9dUCqgBEtOl1qWBOSi7Ou0=;
 b=UmMFdopp7eoQHHpfe6UlFa/0L7khJMJuLBgfqFBi91X1wuFmTQH+BkmAl4gJwQtUYVhH7LsuDaItuu5RMOC7BhAMWfUQl3nJcPKy5PYo1/N5EW0x6I0SeeGZtgEblT/JTFt1tuSQI0J0PF3qbZz6YcPlYwtsGpKy7roif0MJINk=
Received: from MW4PR10MB6510.namprd10.prod.outlook.com (2603:10b6:303:224::8)
 by PH7PR10MB6226.namprd10.prod.outlook.com (2603:10b6:510:1f1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 10:04:43 +0000
Received: from MW4PR10MB6510.namprd10.prod.outlook.com
 ([fe80::299:724:f009:e817]) by MW4PR10MB6510.namprd10.prod.outlook.com
 ([fe80::299:724:f009:e817%4]) with mapi id 15.20.8335.017; Thu, 16 Jan 2025
 10:04:43 +0000
Message-ID: <4b9e0d85-7a75-426a-86fe-faf6107a3692@oracle.com>
Date: Thu, 16 Jan 2025 15:34:38 +0530
User-Agent: Mozilla Thunderbird
To: Michal Hocko <mhocko@suse.com>
References: <e66fcf77-cf9d-4d14-9e42-1fc4564483bc@oracle.com>
 <PH7PR10MB650583A6483E7A87B43630BDAC302@PH7PR10MB6505.namprd10.prod.outlook.com>
 <20250115125241.GD648257@pevik> <20250115225920.GA669149@pevik>
 <Z4i6-WZ73FgOjvtq@tiehlicka>
 <6ee7b877-19cc-4eda-9ea7-abf3af0a1b57@oracle.com>
 <Z4jL_GzJ98S_VYa3@tiehlicka>
Content-Language: en-US
In-Reply-To: <Z4jL_GzJ98S_VYa3@tiehlicka>
X-ClientProxiedBy: MA0P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::10) To MW4PR10MB6510.namprd10.prod.outlook.com
 (2603:10b6:303:224::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6510:EE_|PH7PR10MB6226:EE_
X-MS-Office365-Filtering-Correlation-Id: a56d6f3d-65b6-4791-f130-08dd361532ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3QzZmgxd2NGRmtoZ0Z2eVQ4NDZjM0ZiT2EvQ0o1UWJieStIRWMvRHZMS2tU?=
 =?utf-8?B?eHBuOERlZ0c5VjdOSlVzelp5d2tOUHlMZGMxN1ozUWl6U3ZBbUxPdkVyUFVj?=
 =?utf-8?B?NUgrUHp4RGROUkp4VDZiNStwMTV3UkhBZlpWTXpMa0tvc1VzS1NrM201R20v?=
 =?utf-8?B?MjdSQXA0Z1NJcmQycWxwYXc2TlNkY0ZQVlQwUDVtcERaRHEwTlBMcjRuRDZl?=
 =?utf-8?B?a3daS2RsdzdsNlBKUFcyWVd0azBQckdTbVJ4Y2pDSk9mMGdmMzlXNWQxZEVO?=
 =?utf-8?B?eTBBZ3hzSW13eVloL3dUVnowVGwva1BXOUd6YzBUREF2UnVsK2dtaVVWZTc3?=
 =?utf-8?B?VUtXZXhXcVdIYmhDb093dE9aU3FQRDdERUZhUm16RTVSdjN2dWxSSE1BVTVF?=
 =?utf-8?B?THBXcDhRWVZ2QVBpOWNyWHRpcVlWYUpLMHdRTjZZaFFyN05tZE91R21zVEdo?=
 =?utf-8?B?T2lMWTRWM28rcG1pVVBaRkZhRmJGeU5lc2R2cTN2VkR2V00xMkliWkMvWEty?=
 =?utf-8?B?R3VwVmNmUmtwbHk4SEk2ZWxBSTd4ZHFXYkkrbVpVRGRYWnR1N0NWNUtBMWRO?=
 =?utf-8?B?RVIwdm43aHd5dDJPMVZUWG12MlYxdENUSHVMZXdvd2NoYjVtNm9mdnF3eUpK?=
 =?utf-8?B?WnErQjBkd25ybklZS0VkMWZWQVNaYTBiTDRSQjRjcHE5b2tyamw5Y3hITXFT?=
 =?utf-8?B?cnZzbFJ6RVRObzFPQmFGeDlQV096d2FqaFFJditjRUNzQ01tM0g4THJiMTFJ?=
 =?utf-8?B?Q3FENHhoVUYxZEtiN3U4QmVBS3crVGdTYVFTSmxFR1h1U29qTHdpMEpKZk45?=
 =?utf-8?B?UGNMVFl3SEF3bk54YWlzeittUklDQU85dnBkQk01REFTRTdtUnR4UXEzYUZN?=
 =?utf-8?B?YzNCNnR1Vmhra2tpcWpDRjZockN6RW5NTSt0UW1mWHNqZXFOaUlEbUVGYmVq?=
 =?utf-8?B?MVVPL3ZPS29RcTc3K3RzRG9VY1B1UU5OYmp3bXo5ZnZMdmVmeFFNc01DNDMz?=
 =?utf-8?B?OEI4eGI5OUtHUUNkS3QrRDVoSkF0bVlPaHNsRi9uWTluRnpxTlh2Tk42RFlD?=
 =?utf-8?B?eWJDZDhsYmNBQ3lRQTB2NXBaU3crbXFWVEh2d1AwTUI0UjR4Y3FYSGp0dGNN?=
 =?utf-8?B?blAzaGJRcWNmMGN1d2xoZEV0NCsvZEtzZ2tMaVFlWE9nVGRnMURUQjQxWHRj?=
 =?utf-8?B?dzdaRkZudWx4SGNxNWtvZ0d5UFlkcUFNTFQ1WjJaeHE0c0JnTHpMdWE3V1kx?=
 =?utf-8?B?TTFOa1ErYVpURlE1QnNUd2sxZkc5dzhLcmJJNnhaQm5KYWY4elczMStLUnR1?=
 =?utf-8?B?ZDVTQk9HT25rbEdYR1ZvcG5RNEVOQXdRZGdlU2g1S1A3WjFDYUVuUG9KMkh6?=
 =?utf-8?B?ZDFXNENmSDJaSjhHQXhYWUJ5RVdCWVg5b1hNbW00Y3FSeUpNQXQzUkZYQk05?=
 =?utf-8?B?WjgrcnZuVUE0VUhiRU5qenk2Smc2T25IOXVZY3VkTitrVTZHQjd3LytBUTBp?=
 =?utf-8?B?S3Irb2JVSUVUbE83TEF0UG5CREU3YnFhTEJ4SzRZeTNUb1dVS2w2c0orTmNv?=
 =?utf-8?B?UXVUZndIZWwxY2EzUlNrQ21PcjdQUDd1a2xWQUJIRjlCdEVwbFRsUThDSkpa?=
 =?utf-8?B?cEdlMnREZjB3aG9XcmY3VWp1MkFEL1g2UnVlQ2lBeXdwY004SVJDckJ1SGk5?=
 =?utf-8?B?M09MZmN6bkxVOVhJUjArYjg4VS9vc05Ba1NkMDc5VEFFWmxHMFRyUU1FUGR2?=
 =?utf-8?B?dlpLTmkyMnNjMzRSSWFtU0U4eWNFOWY5TlhFRDVVMlVRWE5GUkl2a0p2QUFI?=
 =?utf-8?B?d0RXUHNYNnBlTUFiWXU5ditxaXFXRjVVKzNJUDRDV2t2TFNZQlMzZ0tpZStM?=
 =?utf-8?Q?x0qxmjWmzzcW3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6510.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEk5NGZTaHBuZmtKQTNoSi96UC90cXd5R1IwbDUwWDEyVEtUNVRCUjlhQjNl?=
 =?utf-8?B?THIzU3RZdmNZelB2NXhyUjhscGRud2tOTG0zZmhhUzVreUhuazNWOEVXelZI?=
 =?utf-8?B?MGc2V0dVN1o5TVJ0dkQ0U1h0anhkVmRkdlNTQkNlZEVZYWhqUCsxeDNDTTZF?=
 =?utf-8?B?a3VDYjl1eUNoWU8rU2p4QnhEaDQybDJvQ2YwMzlOUHBXeWc2czdVRzdGbTVo?=
 =?utf-8?B?NnlNbHBVemdoOVZRWEFHK296MTkzd3RNSjFueXp1akg1TERUZ3I2bWI3dW51?=
 =?utf-8?B?ZndzTXpwWXkrSEZRY0t3aFU2emxIYXNNRVhkRng2MlZkcEVGaHJ1OXkwMXNT?=
 =?utf-8?B?bnVUYU1tcmdoMmhTcUV6MVVwalVSeWMxU2hJRmNTTnFPT0kzZFdVT3NBS0ZN?=
 =?utf-8?B?RFYySFNTR0NoVHBGTTBUeGczSTFudFF4UFNIWHlqM2lqTGdQcUFWMmROZXpG?=
 =?utf-8?B?eVd5Q2NwZzhzQzFPQmxpNDJvMXU5cnRLRlB1ckZKNEJ3aEZTbU1EVGZmQ0VX?=
 =?utf-8?B?RnZrWE15SUVkMnJ0Z3hmdkxwaHF3SHdXT2hXVGhER3U1d0J0eEROREw3L1N3?=
 =?utf-8?B?dGJ0MDg1RHFkWnRXZko2U2tCSnpSdE1rVjdJUTlRbGVQalNocVUvbDI5alBC?=
 =?utf-8?B?RFZxRWVBZmhFSzl4MDI0VXByV256S241QXdacFRLcllnRG9LVWJWNzIrOHZo?=
 =?utf-8?B?MmVFblREcFlyOXg4VFV2WDFBL3l5Rm1TUnlDUkdUSDB1STNxLzQvTVFkeU93?=
 =?utf-8?B?bW5mNU9OMFF1b1FaeHFhUFdTbzB5K21hT3NIWVFPdWVJTDNMbnF0SVo3R3cx?=
 =?utf-8?B?TThjN3ZLellJRm5PVExKVXpnc0hMb3VxS1B3d1BjdXZCUHl1QXM3d056bE9V?=
 =?utf-8?B?QkZRM2JIWkhXWWk2MmM2Y2pZOGlrODlaSHVtdW9XVXBLaW50OG9MQkhpSFFC?=
 =?utf-8?B?MGNDYzIyMkxIWDNVVEZEVlZoSWllb0xic2F5dU9VS0Vkek5LbjErTS9JL05B?=
 =?utf-8?B?T2NzdUd5YTFoWGkwV1MvYUtVTHJRZkRHTDlkWDY1YzdLaHF3Ujl0OXM2V21X?=
 =?utf-8?B?TXpLNUtkb3hCeTRKY0tuZUovQlhJTGNOckV0aDhQc3B3VCtYVGEzYlJqeTAy?=
 =?utf-8?B?cFRWRVYzUWdSZUcydEZiWnZ2c1hLbDBWR3R6UDhDMURDc1NqZ2k1OERHejdI?=
 =?utf-8?B?Q3hLQWJtTGhISW9CcFY2Z0ZTN3pvb1E1VVFKOW9hVjVWc21LUjNtbUJMRkZI?=
 =?utf-8?B?QWtHOWI5MGYxbWc0OEloU2ZSRU1ZRTdCdm9zcUZDZ3JzWjMrUkNhdHpleFJY?=
 =?utf-8?B?UHc2UWpCUm1uU29qL0E0TE9CdWFEc1FmdHJuVXNBc3BkNXZrWkRNUzAvVDdh?=
 =?utf-8?B?UlJtTEhDMFdydEpQeFNUSWp2UkdhNHZQMHMrUlBGeUVZSC9VQ2Z4aUkrMHJV?=
 =?utf-8?B?UDhvSWJScXFBVmE1OXUrTm9pUTJIUHpSOUtzOFZBSDdUOUFuU3ZlTXJjSUJx?=
 =?utf-8?B?eDU3NXEwT3RnOTNJanZvMWpzeWp2ZHAxSE1wR0diZ05uZXRrZ252RW5BMlBa?=
 =?utf-8?B?ZFFrb0crTEg4UTJEYStqZU92ayt4K0NGUTUySTNKK3FVY1FhR2l5ZSttT3dC?=
 =?utf-8?B?Zm0wUkRzSUY0Z1NIRTJDcU8xc1htUEIzL1d4N1AwT2xJdzlKclBSTmxzNXN0?=
 =?utf-8?B?bnk2VnE2U1VNdG9ZbmU1OFgwbW9aSWZrTHpjeVV0WDdZWS9PQmxIdldWN2ly?=
 =?utf-8?B?UkNwTFFyQk1QZitMODVDNUFtMEJpWEo2bktJMlE3ZVF0REhIYzJhVmlTVXdS?=
 =?utf-8?B?NllnUy92bFZ5eVNpYU9QOXl3UEZOa3FIcnlNd0xCTDVkb1l5V1BTMUZjazlB?=
 =?utf-8?B?aHljYXB5eDA4OGtBU3JXdHpZWEpFelg5NTVMQ05OTFB1NzMrU0hIbG14a1FE?=
 =?utf-8?B?NWdGMGlPV0FPeVYxR2J0WkZXZENHZEM2TmhPcEdWUVVzcmFnN3BPc0NqdkVM?=
 =?utf-8?B?WkFPT3gzcU1sS0VlL1d6aGNHSUxPOWdFUHRRZzVCZy9zeG5KbWZGamp6Yjd4?=
 =?utf-8?B?WENBbUJrVWFYc3lsbEx3dEIvdVkwbUVKa1EwNmdvOWNzK3RPcWFmVDZ3bUk4?=
 =?utf-8?B?eEJ6NWYzRFFWOXN0QWs0MitSMWlNQXZQVVVMZE9VTjl1SzJoYmtxd0pxWlU0?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Gx7Td4pmTp0RAVP4VG4ODPEDF14tIVu1p7fl4cJHPV6WOyZSs7aJschwqrCSnWMn7gtirRqxj5Fd0cv5VYpu3abl+DWAQXOr7i7qLuM1UF9DDNggfSsHwu2FMqFFyDxC1eAA7KDjTmp+eSElnHOmF3qzj1Fj22Z6Sus1Q5ogP9XhSvOnr2rDFoXTbAuAAd2r5nksnvfWBfhcw3ZmuIKFh/Av8VD1MH+LudRjQioZN4YWTeeyyx5UWyPPkWebboqlRKijkV/w0NDBVvP9QSxQYSmCi5fHGjY5nferNPHwSvgfsaGFwBJnaAyyx67TNMtdOVL/SO9XLlogW4stsY6B8cYlbKXqsmyPCPtOpnKZhHyFSn7ty80lxFFGwLMYWOy93OrBNurRj2/2cSlq4d22Htsys3pXM6CfY7Q198RYdI7kdnXnEwYF/Ua3DuHXZCk4Y7ZBvj2w2S/azSrAtCpU60tbWUljbw+65BHj++NJ+tjzWBYLF3aDu9XA1bT3gj2GhYe5I11cmY1oRH32eBryXxkvEciO3ElYIHwpt2jrECt2xKmitrSWFSYhgtqgfturGnq/XaZQIcE3O0ZNNsRzZEoKIVHJdwV62EohTE69oI4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a56d6f3d-65b6-4791-f130-08dd361532ad
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6510.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 10:04:43.1673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwmijypQB4weortL+tvG0YUrFmLErXxc46sMLckvYZM7bECGlpY/WLWM+LIqKr2RLd5BrmOlEHZPtje/MpG1FQjFp7AKb+H5N1PV5xKBMVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6226
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_04,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501160074
X-Proofpoint-ORIG-GUID: gmEzbcxdkcnpGBNz-WH8HcIk-Sds99A-
X-Proofpoint-GUID: gmEzbcxdkcnpGBNz-WH8HcIk-Sds99A-
X-Spam-Status: No, score=0.1 required=7.0 tests=ARC_SIGNED,ARC_VALID,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] Issue faced in memcg_stat_rss while running mainline
 kernels between 6.7 and 6.8
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
From: Harshvardhan Jha via ltp <ltp@lists.linux.it>
Reply-To: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
Cc: ltp@lists.linux.it, cgroups@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Michal,

On 16/01/25 2:36 PM, Michal Hocko wrote:
> On Thu 16-01-25 13:37:14, Harshvardhan Jha wrote:
>> Hello Michal
>> On 16/01/25 1:23 PM, Michal Hocko wrote:
>>> Hi,
>>>
>>> On Wed 15-01-25 23:59:20, Petr Vorel wrote:
>>>> Hi Harshvardhan,
>>>>
>>>> [ Cc cgroups@vger.kernel.org: FYI problem in recent kernel using cgroup v1 ]
>>> It is hard to decypher the output and nail down actual failure. Could
>>> somebody do a TL;DR summary of the failure, since when it happens, is it
>>> really v1 specific?
>> The test ltp_memcg_stat_rss is indeed cgroup v1 specific.
> What does this test case aims to test?
>
This test specifically tests the memory cgroup(memcg) subsystem,
focusing on the RSS accounting functionality.

The test verifies how the kernel tracks and reports memory usage within
cgroups, specifically:

- The accuracy of RSS accounting in memory cgroups
- How the kernel updates and maintains the RSS statistics for processes
within memory cgroups
- The proper reporting of memory usage through the cgroup interface

The test typically:

 1. Creates a memory cgroup
 2. Allocates various types of memory within it
 3. Verifies that the reported RSS statistics match the expected values
 4. Test edge cases like shared pages and memory pressure situations

I hope I explained it right @Petr?

Thanks & Regards,
Harshvardhan


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
